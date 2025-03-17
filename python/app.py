from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import os
from dotenv import find_dotenv, load_dotenv
from langchain_groq import ChatGroq
from langchain_core.prompts import PromptTemplate
import streamlit as st

# تحميل متغيرات البيئة
load_dotenv(find_dotenv())
GROQ_API = os.getenv("GROQ_API_KEY")

app = FastAPI()

# إعداد النموذج
model_name = 'llama-3.3-70b-versatile'
llm = ChatGroq(
    api_key=GROQ_API,
    model_name=model_name,
    temperature=0.0,
)

class Question(BaseModel):
    user_question: str

# دالة توليد الكود بناءً على السؤال البرمجي
def generate_code(user_question):
    template = """
    You are a world-class senior software engineer with expertise in writing clean, efficient, and well-documented code.
    
    A user has asked you the following programming question:
    
    {user_question}
    
    Please provide a professional, clean, and well-explained answer.
    
    - Write the complete code solution.
    - Include comments in the code to explain key steps.
    - If needed, mention the programming language you're using at the top.
    - Only include code blocks and very brief explanations if necessary.
    - Avoid unnecessary text outside of the code.
    """
    
    prompt = PromptTemplate(template=template, input_variables=["user_question"])
    code_chain = prompt | llm
    response = code_chain.invoke(user_question)
    
    return response.content


@app.post("/generate-code/")
async def generate_code_api(question: Question):
    try:
        answer = generate_code(question.user_question)
        return {"answer": answer}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))