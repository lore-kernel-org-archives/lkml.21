Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795411369;
	b=qEYJm/jfR8A2cFrXNqeHqCPohF5Vb97/UMbFjIjRRvpw43huH64tZMTmD3s2pyoMIU+H
	 dV4zkNuSieN1PUkdWmhGwVbYrAyfwJDCzwXi/wnJgQ0hxt99LxWKetSHLKs91lmt2xKxO
	 Uc4lI/JgayUI2ml97o2cKNakT9KtsscNTFfP8tcviNWRjVGRa4L+JEsitCaOxkMswOKcT
	 YsREro2MIA8AnxfzfoyVghJCOpqigMN6Tb8H5OyJJNPT2KAzV2AacnUna/KGLucl99Lwr
	 ioYFBTWfCRPOINtwYMiD/zN05Ql7dSo6MVRmZwg7NE87HNlhpGaRtCN1OTa+0LHV5iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795411369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=3Mldy9DU+r/shbk+s4+9YUnzttoJhNXT94VNGbnnMOg=;
	b=eOtz42ND3Mq0ezupjOhjtrdZLTTXsD6A8SPJA8hiFCW5lNOw9neA4IvflWWLVUw4l9bE
	 zvju3z5KRvHZplrGoGnWcmoE/A/s8OyyYqBJUQ0rUAh8YFujBV+75Vd3a3L6c6NG7ghYI
	 o9o1170n3eKu9zqpsYlYLkKl0L2fzyCfMCRw1Ol5/UUv0TL++WoPXtjs5KvWWqG0Outz8
	 bb65IDHETDnCva97d+4SKkfIaRWuoQe+VrYOubUU8DO1f21RS+csXyotlTvC8XIzmpZ+C
	 Ayjcr3Ng8kytlB5XImSTMLXmNcCoS1Ph3QvXSiV/0n2OLGDWwjQlhZx+S4LuXa8L9ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Y5ecd6Ig;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75840606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75840606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Y5ecd6Ig
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6ba863fc3e7so34754a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795411367; x=1796016167; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Mldy9DU+r/shbk+s4+9YUnzttoJhNXT94VNGbnnMOg=;
        b=Y5ecd6IgOORDYZiXDrRsUypNd+hLpT4rCC0ZcWtfk05oBsH8VwRKvXB7/pSNSJ0Ndu
         6U+DW0Tm6Yi9UhIaEbL8BHtpz1fFTv4vNNbHj0/X/N76aaMOh06H3NQV2bGkxS1OOzY2
         udtlVPyN8wZjNB3dlVIh0QfD4/R8KG2fIYtsaf1ON9qwlFAa+JdQZRAKQOFp1Jtu53On
         qb95y7IyTFRODMXf9e0GLsexX/UtN9sWnZTy5q3oLMi5WjVg3YZQOFRk7PM5m6OaSkFw
         zaT3gV8UKRpvHh/bRjB/IjN1n5F4peH+NeDnmyIgVH4VWd4j6B/+YfFbbiUtlFAOB94t
         YUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411367; x=1796016167;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Mldy9DU+r/shbk+s4+9YUnzttoJhNXT94VNGbnnMOg=;
        b=D3o0t1nx8KPEMn9+ZfNSyJeWddnUQH24pTIgCyyG0BHpmRvZn4z6IX7zRsOPH9CSkg
         +9+DfENYJPxbimjJc1+Vw35WZqPeMYkqXtPX5UfyddAnKZZRY8LrnqZ7vd7mwKqa/fR+
         A0Br4JuGe2qMT6lo/rlI5yVN50Kvd5HqHGLgsCphTBeq92pwTGs/N3kxSawrw38egRnk
         MpBTXAtSBqMmvsgEWSIPdLLsAJbV/RE1DPPgpJXyLtCvy4CnZL30R31q17Ah1/eltmI7
         P0TNM7JUfPvwECPQI4n5XVMSnw2kwTrUDEZozI32d3lLuwfLcJgMw6CaXVJlolUfmOvL
         NNqA==
X-Forwarded-Encrypted: i=1; AL+hErGOMobDw7pQO5Z5f37HBVzMQuQTqlFXV5kAm0n3sR/T+Tmz9QXJDoeXNLFyZgsBVuyATlJUuAC4QEqoYo0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ffld7VZhnJyzVxf3cycnh74GFdWHbRuaXppTtEPyOBjh8Wzxx
	kP8LTmEdCje/XxvqQU2fIe+kdX9ZRAHIP8T1GjTSVXjnFWzehN2dreq+ChyJeDQTv84=
X-Gm-Gg: AZFdTZf7TYHFi8kcgPSiwx+7GwbhWPCqhPZr1LIJF31S/SLo6JWOPnGjfz8BxgT3diZ
	/seKVC8ypWabQQ1CCCLmvC0qpZX2kK68YxQuOtxSMTK+J44tFNZO8tjeSgYATd14HePeKQqGb3E
	rAQ8BnoE6IUODeKRKLrh4mup2jR6b9ETRURyN1Xl90SQ91S2DUuJZ2SChYlZeTYJeQViAA9ueh9
	dU+soDn/x6o3pVoaradW1OyuuvKHKBxHwedQMxuEES4Rgx0GY8ynuol8JYUu0p5LHMjr5PkQYN4
	a3NYbgSOvdwZg2jB2sOTM6cSRNpGTOEc06Qm9ZdGK2fUBBe8xGiWQPUkt+xGg3dTkMOJwtbzgK0
	LzFqI94V59n294YTn2sCK4eO14/HvuXB0vwYIDptXmNQZggrVEh8nkU8LPFuodgmWfeV1fMA4fg
	rqw8Hza961NLyycgSsknqonW/TNLkUL7R+w4pZSgCXBGFWfhnJ5l28NzVcgjy0zNn1KP5Q3zIFU
	JMKvXQxFbpFO1b8aWO6JQo431kSdt8qRMfbwXDfLn7Ayq+uVEpgckyE3vcA+ujk0ELUlAv8iUSB
	2IjDJFaBYnenXoF0rVTPM6ENbftZH0Nf63Y=
X-Received: by 2002:a05:6402:90d:b0:6b7:dace:635d with SMTP id 4fb4d7f45d1cf-6ba37ac9214mr8144108a12.0.1795411366855;
        Sun, 22 Nov 2026 21:22:46 -0800 (PST)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1aa3sm45726785ad.21.2026.11.22.21.22.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 21:22:45 -0800 (PST)
Message-ID: <d233c82d-4723-477e-b51b-4beaee503082@suse.com>
Date: Mon, 23 Nov 2026 13:22:40 +0800
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
Subject: Re: [RFC PATCH v9 1/3] ocfs2: Add new ocfs2_map_blocks() to introduce
 iomap feature
To: Joseph Qi <joseph.qi@linux.alibaba.com>, Christoph Hellwig <hch@lst.de>
Cc: mark@fasheh.com, jlbec@evilplan.org, ocfs2-devel@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261120060014.12087-1-heming.zhao@suse.com>
 <20261120060014.12087-2-heming.zhao@suse.com> <20261120183415.GA2450@lst.de>
 <85cd5f2f-5b08-4aa5-9b4d-7e271d021c1e@linux.alibaba.com>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <85cd5f2f-5b08-4aa5-9b4d-7e271d021c1e@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/22/26 22:29, Joseph Qi wrote:
> 
> 
> On 11/21/26 2:34 AM, Christoph Hellwig wrote:
>> On Fri, Nov 20, 2026 at 02:00:11PM +0800, Heming Zhao wrote:
>>> As part of migrating OCFS2 DIO read/write code paths towards the modern
>>> and performant iomap framework, here introduces ocfs2_map_blocks() to
>>> replace the legacy, high-overhead buffer_head based block mapping
>>> routines.
>>
>> Do you have numbers to antiy the high overhead?  Or should this be toned
>> down a bit?
>>
>>> In addition, OCFS2_MAP_* flags are defined to gridge OCFS2 internal block
>>> mapping flags with the iomap API requirements.
>>
>> "gridge"?
>>
> 
> I think it is a typo for "bridge".
> 

Yes, bridge.

>> Otherwise looks good:
>>
>> Reviewed-by: Christoph Hellwig <hch@lst.de>
> 
> Reviewed-by: Joseph Qi <joseph.qi@linux.alibaba.com>
> 

