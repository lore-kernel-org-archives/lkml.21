Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795183937;
	b=D1vusHG9IqlMR4CVPj53g+DDtb4hmWrOPD2e5hdnFBtvkMGn+tjny4WDSIQoaSlA3H5z
	 h0Eu+xT3PAz90kME3GceAKjEcEUOORinb0ExYypuaA2Dv6P4QKBbvitsEaKxM+oj9BWR2
	 YwYNsnaMYx2h14xCP1pvhhTIdXWH+GHBpqPZ76BhTaTkVocB27ETeUws8z1oHpcY3pKgr
	 9HpiUKXpgWQ4d6Y6lN2ewA+zanRpAdM6o7oCxvyWbVjPajXuEtzJSwl8hqzvj3CUd9w7N
	 p7KFzJ1KOJDfBLcDtswawaERE2DkbxAECUGaxh6cnZdyzfI7KIoCUogupmMIkbTZzfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795183937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=xbe6FEnNEDzgOKNdVMSNVPy6O8NMwRnW9Mm8QaM0+hc=;
	b=PulOseuwEnF8O/WDUWo/n+ZYCWK4qglwFBKG5psFoL/VjT1IxU/5PevTi4MxsSXwgwto
	 uQh588YFxQpgp01IgrZb0dedYfNaXZ3OqqHBo7iPH68esAHJe0hX18+6b8YbjMEx4hMx2
	 fhHEH2q3hMED3onJ3VJldASLaqri/4Fm6rOYQVsAHJl+SC64KeLceo8YbKYP9totj3VRu
	 4Kq4qcC64Lpl19/0X2x1w5pB9HPDLRuGJ2fWI87R2Yu44cu7B8KUmS9HNJluli4YiWi+M
	 1QQYZjpVVkJ0/T8sRasxrSFffP9hOr83m4U/kD7nLGQSMamcaOH24oLiRd5WcyKnl8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x1oBIf8U;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC8E606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:12:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DC8E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x1oBIf8U
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so5088035e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795183936; x=1795788736; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xbe6FEnNEDzgOKNdVMSNVPy6O8NMwRnW9Mm8QaM0+hc=;
        b=x1oBIf8UCCQB9dSubB0VIFuiEhC4yxJ2bx8+aem/zyiJBSiev2PW+qDo9bFGtnMAbr
         JDQxgdBFeyj8zytl1wLzSKbQMdZbtwHM5MExcLCSMLkfKXm+gTbY6uM01I3zT9etSQzD
         kAkISVney4cH+g9uVsITYGRZ4IwFWE3Q4+iduXrtFXEhPqB0h4zWMbgiu/Me0xi0l18N
         5e+zdm7UOnI2RCo+XNLr7PAF52n6geXRtF9UW8XjB4AmbBNLiikbHVsj9V3ifm/NzuE4
         KVGw//mpzWAmMt0DOMe19MrcpwbitUAZE1KZ7QBCDjQQ+LMMfDju/PxADk0YLL1ZzwjF
         emrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795183936; x=1795788736;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xbe6FEnNEDzgOKNdVMSNVPy6O8NMwRnW9Mm8QaM0+hc=;
        b=EE3J86zyR0SZ2ed1HSN8ZR9k8tHLrp4VtNuoyUnMxnNPG8UhCvHaRLgmvWI3wwNABh
         M9NESkwexRlBrI35JHC8iRlz7mNaAuE1mgS6QPnYPoFi16lLjGR2kmouQIyWI3DJzNiY
         2t30tv628hb6RBiFz/1ihVuGOJLvvnTW6tBmxxjHRplcwGrRuRndzQR/bUM1Dw4h+GEg
         R9Cg5fRB5PDn8bRl4yV7zoz1RfsKr2tkZ9zwcMUzqzDxNb6iWhIyyPEBwPg0NVlx2nNz
         7N8QSuiGqiKed88ajwC2VRLdN6IO/NzSRio94jcSwemTeAMdAq6LfcVIHxdMLYKO7fd1
         hHVA==
X-Forwarded-Encrypted: i=1; AL+hErFKzbhpVlouPtK/QWms77xP32bC2jdZVw/HJ6600hGxtXKNBeGP0FFTAn+sukgr1XvPX/WvVl6vKWIF2Cs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2yQHnhOdovfusysy7dhe0x6Y706QZC9cjUZPiKxU+yVU9Gsn5
	dQ3rrpgji961pTa+rHwJHvGeHrxwXjh8WZJwIIIzhdzpgDxh9YDs7v9T
X-Gm-Gg: AYBFou1FOYp39WxDAN8U2SYxFfM93LpwjniiG3XzDjFVsEQ25b+bnXpfZb115FSyCLc
	57tlkUvy6ITG9lo3eTjP3iO0OT2xiN9VPzGwvuPHK+Vrr9SBTFq26l2dGgfXALf/ZcsYmvZ6a0k
	HGEMv1eo5Nwd1ZtlU3On9wSwAVtQP+mNLRO5L2K7h1iQ+vwzgdeijUQCFAFZ0+7DyVHZsU8HRVm
	S0UIs7rf3EDddpAOso2EIf+541OEXUpNbtTvNr7wySTnqhHyjB7BZkT1l6RbtY1bLxpKp5hd03C
	O7Gqi9r/QmFnglEuu1mLGUg6rUC1MhhzFjqAC78rYPmpuXfoeiMTdrgzOytruF34yDW3G12zM/t
	i8GOdYXmM+aBx9ZI52eeJlujVPCoMvN+3Q7q0SM6r4xhLYZjkZB5hbajsg5tUKAREoLPu36QbS0
	1Cu3iuLnzDCnSy5ZJuLGX6369/7YA1f+5Fr9N0HTo2y3+ORU77LCbuTrv6DrMH/Cs9Gycx1jfk8
	ByJ5FsYcyaen3gld3eSHNm2T7GMEPRlAE7Ntk7C41OUTB/C47u86OXYkVUU1munVNhmZeaMKqBb
	AfoXf6B08ysMsgYqmfaBh4MO3pkHSQanbYTnaQ9azQSfVN7a6AVRgko0zcHmwIbE9S4kckJOO26
	UzmvacBKlZrQ=
X-Received: by 2002:a05:600c:5249:b0:4bb:665c:a078 with SMTP id 5b1f17b1804b1-4bb8893a89bmr70511015e9.28.1795183935808;
        Fri, 20 Nov 2026 06:12:15 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm92007655e9.3.2026.11.20.06.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:12:15 -0800 (PST)
Date: Fri, 20 Nov 2026 14:12:14 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Eric Biggers <ebiggers@kernel.org>, Qu Wenruo <wqu@suse.com>,
 linux-btrfs@vger.kernel.org, linux-crypto@vger.kernel.org, ardb@kernel.org,
 x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 0/6] lib/crc: x86: convert the CRC assembly to C
 intrinsics
Message-ID: <20261120141214.327eb0f2@pumpkin>
In-Reply-To: <20261120084158.GM2668564@noisy.programming.kicks-ass.net>
References: <cover.1795137348.git.wqu@suse.com>
	<20261120034220.GA11532@sol>
	<20261120084158.GM2668564@noisy.programming.kicks-ass.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 20 Nov 2026 09:41:58 +0100
Peter Zijlstra <peterz@infradead.org> wrote:

> On Thu, Nov 19, 2026 at 07:42:20PM -0800, Eric Biggers wrote:
> 
> > So if we're going to proceed, I'd at least like to see a version that
> > compares a bit more favorably to the original.  But also I think before
> > diving into this approach I'd like wider agreement in the Linux
> > community (x86 maintainers, crypto, etc.) that the x86 intrinsics are
> > the way to go, and for there to be a path forward for DOITM as well, and
> > hopefully some interest in improving the compilers too.  
> 
> My 2cents go towards keeping the asm. There is no point in fighting
> compilers over this. The very same is true for atomics.
> 

Indeed.

IIRC the code loop had to go asm block because the compiler pretty much
refused to generate the loop that matched the source, instead it
generated one that added extra clock(s) to the loop making it slower.

I've also use some of the 'intrinsics' to write a short C function.
I basically worked out the asm instructions I wanted then tried to find
the correct intrinsic.
The whole thing would have been just as readable in asm
(possibly with some #defines to give the registers names).

David
