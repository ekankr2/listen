import db from '@/db/indes';
import { Boards } from '@/db/schema/board';
import { NextResponse } from 'next/server';

export async function GET(request: Request) {}

export async function POST(request: Request) {
  const res = await db.insert(Boards).values({
    title: 'test title',
    content: 'test content',
  });

  if(res){
    return NextResponse.json({success: true})
  }

  return NextResponse.json({error: 'fail'}, {status: 400})
}
