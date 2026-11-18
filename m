Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001563;
	b=M3KxSxhdjnShWbdNiTgXLU/DYZ98TsyOmoaJG4WxJCY1iuxmVvPxYeFFQVbwh/Zn3z2U
	 TLa+nfrlpTTR5jFrnlUaW15RcwR36Dyd6GiJ6Fn1vdmnX+OIM8cYtXlILqX4YpaqdT+ez
	 JQ8XsjV4r4mrvxQO0l1lCsIX2rzVFvovKoXOy1PC3ynDfw+YgIfp0c7eXwoAMqm4IMC6z
	 qhAEOcGWmqlteHI9G2BmR1i5NgyCKFORc5vC6dbDoiZXnjuerWKykKTBJ0LVNAm173iP9
	 ujZrj5J/7IbZ/KZObLV1feqc6BKH/D26AlZtMU3W0uWMUTtKj5orz5y4VB4dRVT26iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=H9Cu/kf3uQAfc3wOhY3cicQG45Gk9MDAfDaeHK7X00E=;
	b=yGALtUjPGiCj8AcestGbeOQrD8PJkm+dM738WGW+PoG2BEq9Mp2jN9jnUx4MdH9ei5dh
	 A5l22OBdgTOPe4XUS4DmX+CD9AhVOmJkC5b6URlYLgBfPkFo7nKRdPHPSnCPtVOON+Wgh
	 JKpw/sHqDCpvTQVTJNtZX0+qaSKyxwdEX6/teXuJwZeinkGQnryaMY//laowA8Yh/qV/P
	 KWyBpjBfwr5daVhNWAc948uDZYKIT8daupSY6te5174xsMkxj7HWItLu0cfHKau4kfebt
	 7L5YYu195dGcSIpXxJfjukSC3P0HKCWC1cNAscfrpo9h19O6X3XDw9h+qg1CKaJPKqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MiO4jiOS;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A075E60A2601
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A075E60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MiO4jiOS
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b3a5c9130bso524106a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795001562; x=1795606362; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H9Cu/kf3uQAfc3wOhY3cicQG45Gk9MDAfDaeHK7X00E=;
        b=MiO4jiOSh+izPlb/pD5mMnf6E+AnfPUK+Am2VeZt4OkNeOu10ClNnidnE8xaC0lGWQ
         nGA4z/X3MtrsrTxY0gMXenchWlLtDIfK9w3NuHacwElr4aGbwDyHz3j6B5DBapuOeYKo
         jcWdB9dWo24fWmVq/yEdw5/qWKypllnpF1UiFVz3ICLySzOFgv7jZNUzh4q+YLgYCa5z
         UPa4IlxYIHYHXHEwlJHRQ6GiLHAHs+LI7rzenJjJy128WSdLTlw/VGgGi5PgmJuh66Wo
         2eDao3w7OZYB79Y59lJIYxfqi7nhB8xAFUks+IWy5HoY1T0syiXMCDJ9Q1ZkFmkIP9MG
         Fymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795001562; x=1795606362;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H9Cu/kf3uQAfc3wOhY3cicQG45Gk9MDAfDaeHK7X00E=;
        b=PEeJC4ynNetEGqRs6/MamoMPhJ69KUw/Q0UULBxI33EmVkonVN0kb801/GYYH8RP4V
         ci7YCxSnBd6FEipPx1mZrRtCjO618mOSRR4us/dNcFWrPxuwsm+IZKJ+JSPPl0CmKxrB
         h7OUDDKR1VI4OdGEO+7KL5rnqaJAOnESA6piboU3XcM08VMa56SQCzkVb5ROVpYqoLi1
         PTGF2lifeLi/MBHxwCN+VPAicQFBu1QYLK8qEvkNmgfEBhpX3WB6XGLh+TkormFJ5Xrw
         zd5DD+d+xBzPPajQxUfXWzpQhOubUNocmzF0++l7fk23961zMbA8gjLUMH9xa7AzjwbS
         v2yg==
X-Forwarded-Encrypted: i=1; AL+hErHcrjCIxaeKJCliW3UX5rnUCGkZ+XBJIkWWA8i8Aejcs5mZijLNDY9fUkSxTN4VYoWzBJSAXBFPq5DrJKQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0qIDP7m/bnNRL+lxCzjzcKyBrP8w+NoN4hzg9IK8S7WSClRQa
	XJYjrOgt1c5uLdO/UusWoAtETP6h3aq3kV9I48A4zTZrS9UmwVkD3Nx8
X-Gm-Gg: AZFdTZchg23zvzslH5BFcb7xmbxrusTXJS2MC4k02aCAMqMrJKTrFft4x56fX0xykSD
	Em0ydBF0KlxDtP9JQ0y67IClubJv1kMMeB2PazrkLAtM+Q6f0k2EGVUNk5LjNMU37syOBReDgaR
	hgysqPekhqtUiWMgMsURP++wxqm0O+VFfqaypZtg/uhAfoLdIU3Ay+o5JGNB+7zI3D58QUvl6CD
	qbjfWSXIdwwFtMyMkI2wPFju2Doq4KK5cnP/UI2VYdP2g2/c3/19YuL1v8SAHzxJzFkPd9/dN9E
	5EXzsDe5QN50anzgbxTmUgh6G44YyAnzjmKd2Cn3Mo3OpPgeRBW4vkgsdV2UpOJHIZQTnvTgUTA
	V7hWll96gQGOynYxRHUm5QJm/fdqHPMFd+35vN2k/yKWyBb/X4LtbmukOq5hNVbPU/djzM2xWHZ
	DlrfPMMoslDvJJ7w8zROeGdBm6VYYT6HIABCOMScZ0Spq14wax4KLgVSDu6/gkSvFDS2gfMhdJZ
	K5zqZD22qMwYQWWG0Y1YD+HyhRAHGyYbmfTgxh8jdlGKcolct7q2/vBMVCqXYdYchFU858RlvHG
	W7+NGZ1R1Sy2dh4qAWdjZ4rDm0Z1z+Z1RDshoILlA7tTRUC4YHdRNQNiXPerNqKZlwYeDQ==
X-Received: by 2002:a17:90b:4fd1:b0:3ac:8ee9:c8ed with SMTP id 98e67ed59e1d1-3b3d074e3dcmr2653572a91.13.1795001561953;
        Wed, 18 Nov 2026 03:32:41 -0800 (PST)
Received: from ?IPV6:2401:4900:1c43:8cbf:33a7:8ddc:7a9c:40f7? ([2401:4900:1c43:8cbf:33a7:8ddc:7a9c:40f7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1acd118sm4024123a91.12.2026.11.18.03.32.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 03:32:41 -0800 (PST)
Message-ID: <0c859418-ef73-4870-a45d-66137882ab74@gmail.com>
Date: Wed, 18 Nov 2026 17:02:35 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] openrisc: Add utilities and clean up simulation of
 instructions
To: Stafford Horne <shorne@gmail.com>
Cc: jonas@southpole.se, stefan.kristiansson@saunalahti.fi, naveen@kernel.org,
 davem@davemloft.net, mhiramat@kernel.org, pjw@kernel.org,
 wangruikang@iscas.ac.cn, namcao@linutronix.de, kees@kernel.org,
 linux-openrisc@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260930202744.50489-1-sahilcdq0@gmail.com>
 <20261026201240.107462-2-sahilcdq0@gmail.com> <au7I8FNoMcsoh54X@antec>
 <52c3ae66-4165-4fc3-a440-fcb76931382a@gmail.com> <avkHMp3Qa_C01Nd8@antec>
Content-Language: en-US
From: Sahil <sahilcdq0@gmail.com>
In-Reply-To: <avkHMp3Qa_C01Nd8@antec>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/26 6:43 AM, Stafford Horne wrote:
> On Fri, Nov 13, 2026 at 10:41:56PM +0530, Sahil wrote:
>> Hi Stafford,
>> 
>> On 11/7/26 12:15 PM, Stafford Horne wrote:
>>> Hi Sahil,
>>>
>>> Thanks for your patches, sorry its taken me time to get around to them, my year
>>> since summer has been quite hectic.
>>
>> No worries. I completely understand :)
>>
>>> I will do the review in chunks so give me some time.
>>
>> Thank you for the review.
>>
>>> On Tue, Oct 27, 2026 at 01:42:37AM +0530, Sahil Siddiq wrote:
>>>> Introduce new instruction-related utilities and macros for OpenRISC.
>>>> This is in preparation for patches that add tracing support such as
>>>> KProbes and Kretprobes.
>>>> [...]
>>>> +
>>>> +void simulate_branch(struct pt_regs *regs, unsigned long jmp_insn)
>>>> +{
>>>> +	int displacement;
>>>> +	unsigned int rb, op, link_offset, temp;
>>>> +
>>>> +	displacement = sign_extend32(
>>>> +		((jmp_insn) & OPENRISC_JUMP_IMM_MASK) << OPENRISC_JUMP_IMM_SHIFT, 27);
>>>> +	rb = (jmp_insn & OPENRISC_JUMP_REG_MASK) >> OPENRISC_JUMP_REG_SHIFT;
>>>> +	op = get_6_bit_opcode(jmp_insn);
>>>> +	link_offset = OPENRISC_INSN_SIZE;
>>>> +
>>>> +	if (static_branch_likely(&delay_slot))
>>>> +		link_offset <<= 1;
>>>
>>> Why do shift left here instead of += OPENRISC_INSN_SIZE? Since logically we are
>>> adding one more insn for the delay slot, not doubling.
>>
>> Since link_offset is initialized to OPENRISC_INSN_SIZE, shifting it to the left by 1 would
>> update link_offset to 2 * OPENRISC_INSN_SIZE. This is a little more obscure than explicitly
>> setting it to 2 * OPENRISC_INSN_SIZE. Initially, I thought the left shift operator might be
>> less expensive than multiplying.
>>
>> I was going through mor1kx's design and noticed there's also a pipelined implementation for
>> the multiplier [1]. But it looks like the implementation for shifting is simpler and can be done
>> in one cycle. Please let me know if my understanding is incorrect here.
> 
> That's correct, but my suggestion was to use += OPENRISC_INSN_SIZE instead of
> 2 *.
> 
>>> However, It may be more efficient to avoid using the alu and write as:
>>>
>>>          if (static_branch_likely(&delay_slot))
>>>                  link_offset = 2 * OPENRISC_INSN_SIZE;
>>>          else
>>>                  link_offset = OPENRISC_INSN_SIZE;
>>>
>>> what do you think?
>>
>> I am not sure if I have understood the alu part. WIll it be more efficient because 2 * OPENRISC_INSN_SIZE
>> will be optimized by the compiler to simply be a single number? So no alu operation will be required,
>> just one store operation?
> 
> Yup, since 2 * OPENRISC_INSN_SIZE is a constant expression the compiler
> will replace it with 8.  Then the above code would be just one store operation,
> something like:
> 
>      if (static_branch_likely(&delay_slot))
> 	    link_offset = 8;
>      else
> 	    link_offset = 4;
> 
Got it. Thank you for the clarification. Based on our conversation in commit #3
regarding delay slots, it should now be fine to remove the static key and handle
delay slots unconditionally.

>>
>>>> +	switch (op) {
>>>> +	case OPENRISC_OPCODE_J: /* l.j */
>>>
>>> I think these comments (/* l.j */) are no longer needed sinc you have
>>> the named macros.
>>
>> Got it, I'll remove the comments.
> 
> [snip]
> 
> Thanks,
>   -Stafford

Thanks,
Sahil
