Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795332829;
	b=3xwehqPP9YvcU8Bd0RZSjmLRnMGKPsshoMg14KoEFuadE+cFSFjo5NBP/gZhw8/EiA1U
	 0mzUU0hCRmf0ifzQy5MJxzw4J3sjabEpXgt4Mx8u4y/qnDv2w+MNb/NC8npW02PMuKqRU
	 xCpLj1WH35UL5bgFqvUExmmsH8r9UU/1QvL4mnGV+vTehmj4OwthpUWe/+dQEhONSCCcf
	 xN4+PopJYLtKfPYJZRmnfryLttKdE3YUrzbu6MSIImTtTvDmyaL7pGfIXR81xZq9jENzY
	 fNkPPbm5KHxCG35E5WPcaWQTmEf2LGhCbIceV0GSwDD7yF4+HF7pS8fuT9BjAggfvBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795332829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4Jc9Q03F2saooXo6TTb3sNlYecivQhO/Q+XUXZ3Oiak=;
	b=vhsMZLHv0fbKxvBv3evYV1sy1L+6WZAKuYKQcS9zOL1gx7UQbfG/bUjSP8vrzcp6Joy5
	 D33j0Ym1jTXzdIr+7H35f3zEhC34GX9+OA+58FSLN3wkjwOXTBSsPM2WIvguFYN64CNyB
	 yj+NNRahQ3n64tdRLhppLR7uKHfZ/iEb9KTzVLrbIf7Ku+/0twfe4XlADMegWUNKxT/Hz
	 qB7QGnWZJBhAotdI5rnn5ijkPh2eK6fzgnYdeSk6FJlmqzyPrinBP1TeKjTUG96H5ZKyA
	 vEeTuVByihBUAPLyDVoCBd29xI6JBA5lcRpzWJL963N5Ya1VmLAkvErX122foRF+UXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iHharhHN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DE8606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14DE8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iHharhHN
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-38587f3de36so2780345eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:33:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795332828; cv=none;
        d=google.com; s=arc-20260327;
        b=Li4SWt5NYvaIXMEF9j4ak4oCeQ0FAy6g9box59q3ZUrcL6qACUaxEpYIdiDdICYuWN
         NpiQoAsuEx/+GZXHugyuWWitQZa2En2jsiR9Vrf9UQ/JS4Vgh/d2dgwNBiSxZmv4BZ3m
         3AzQ/XVFx7wd/P4NtsfxZnZ+J7CjnFN/oBnj5MkvAGGjEK932ptbIziebaPHXnt7m3pr
         S6gLu+rnzZHLJrGjnQO01wvpqVuOcLAyfNWvs+vNR4AeKCFFCkU/ywSCyz7iDDnxcZfD
         V1z8n6SfRCzkXDNJMW4wfKeMkNicZ36TVIkf7lCmTEPnmyPs4SrLdzpm1HrPFH3T/O9Q
         I/Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4Jc9Q03F2saooXo6TTb3sNlYecivQhO/Q+XUXZ3Oiak=;
        fh=dg83stanrDGHAyUaxAHAX11EhVK2zln0tgJjlNKSezY=;
        b=fL4RyAum91vdHMBV/or9a+6qKOcUIy3iFTb7zzHxzD2D7P/9LaYWfBIw4UHUMySYyl
         u7WRaFyU8ilhEMUYvqTl+whIlvRm3pV81/1ITkIDfYOM91uotxfAIQuGALKN5fB3Miy9
         iSa9srPh85eFouRHmK/m3rsxpSf19RGUlLuivC/1uuzUIa2iomWR5LNNgESxC2PwdmDV
         ExkWcg6mO1A80cxLXfN+BiuYpqrZ/nkCuC0DwPJi2mPJUSc9wIUnpcDwx5J+6sCNf/nx
         ZRZ3HO1aZA2IJuN71ptVL+GVLzkTYPhKpkn+nv7SD68yf5An0/RRSKAgcwn5y8Qp+G0Q
         5wPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795332828; x=1795937628; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4Jc9Q03F2saooXo6TTb3sNlYecivQhO/Q+XUXZ3Oiak=;
        b=iHharhHNAvWWmMNmSJORl9CiACUuHi3i0ws3GR9vxP9SD6imQbfrumKrQ+D+3/h4VH
         DUQz2t9UyojNEslSFUoVY0B+eVTMj5udjH/m3y7IW9TI7lh4CDy8qVX2GkJ6WJ5xrNZ2
         uiSYPjl3+zim7UYVdOOK+MxRuB9mWbWEKcTr2Aa5m4eIFeQ1Ij51S3nFtx2RzuPey4z4
         vFrTxVw3E5xL1mbSQxKca2N0FjBwLxtAIsB5K/65SkSc/BFJEELAkUPMlFodi6c8/UKY
         xZjRmXPYOcTChmt3Lp9r4b/KMaSJDe9/30QlmCGKnRQWJwZAM0vmtvtrBa/jXQF0Hk0f
         O/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795332828; x=1795937628;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Jc9Q03F2saooXo6TTb3sNlYecivQhO/Q+XUXZ3Oiak=;
        b=spk22k6td8DQVNM3O1rADnR4+h9H0IP9pEpeM2lOMK+92reuXFEdTqj3qp6Li8jAmL
         PM01Uy26az+eTSGbgG/UXNMm78d9ePWsTJ1VceWhh7Y3Hj6gHalFz69YJLhqGmdOLVLo
         Ffn0sKa6XJdyk/h17vn4U2r0Oya1HGQX3tGgiTzoZW/CXgwEfoT4iNedwDdaWfzO69nB
         69RkR4146epHx2IKRdZS1y7B7aRxN7PymGA9S+cuAHNJZpjD+x9FokCD+Gc1T23H8+u4
         TnW2qltl5ftvRjH1rjCD6jdjHvN/gRzRR773Xll5bz2ppSUA8laqBfEuevypUBTPB6Zc
         yz8w==
X-Forwarded-Encrypted: i=1; AL+hErEl8oNetp4IwWyyEctrjuc1R35HMNF1uk8RhNfGwEZa4rnnq6cZ9+0XVXJQ8wocZ7tz6oNPg/6GwUWfVMY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UNPXMJnjk8hDdIoEJ5qYFenPEI2gR3J7zmjWMPRUwgta0gHAn
	ql7UJfnjcLzVRmSRRbnpEa/Z1tEX7Rh5pXKdJaao2tO0hTbS9a4HAKTYBAv/Jaq1jvaTfGCKRDE
	z0M0aseQKMTUDPvS2mDrS0qId/dZ+SuE=
X-Gm-Gg: AZFdTZfGvE3x3IgUsCJC9fznfnLMnM6g/RTLPrFV9kTrqbocDxEzR4VgC5FHXvkZZta
	xRfDBFV5pHizgiVLgCPkg2tsENaNbbdOhucwi9CiBBnDczMT6VCZEHrDYz4oQ3pfambyv4yhtm4
	kEDpDG+o7SeXF3QBf/A2PIVtanOMi4/rFjT3bGZ3dx00IdjzIPT61CFvLfOSi091Mb9qaUKBYJf
	atBapDI78tt3aqK09ojk9m1RtMBzjCSuwGD89nWFaAS+hC//Crb6po1C+QPemtjis8c5tWKUGu9
	0HOlJ4ovM5zIgcLdQfogaAVoi6nLDSq47WQzHrNpcUCg0kvKe7SuEe4MDJysVWQywwnPLiw1kPh
	ebeHneytS3q0VSKAtXnq2qJ+ci8/Ksf5lot9pdngGmTdFtesC8I7dyFpbuPrhuAG99zq0m2o2Jz
	0AXlwbBYlQWODuOPmWtPewe2h33gJdlw==
X-Received: by 2002:a05:7301:d813:b0:386:8bd2:da35 with SMTP id
 5a478bee46e88-3868bd2dbe9mr5806237eec.5.1795332828030; Sat, 21 Nov 2026
 23:33:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930072450.61836-1-clamor95@gmail.com> <20260930072450.61836-2-clamor95@gmail.com>
 <179305276926.4032096.5720095014424223708.robh@kernel.org>
In-Reply-To: <179305276926.4032096.5720095014424223708.robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 22 Nov 2026 09:33:36 +0200
X-Gm-Features: Aa3M54qiQFO3akCNwqI_UUbQKp2SRj0lVcvXQw852BKZ9oO4Dql8w1L3qsKBEpI
Message-ID: <CAPVz0n3-63X8fQbohNERGJMdytfpqRGSOPOMoNRpWxgmMaMrUw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] dt-bindings: power: supply: maxim,max8903:
 Document MAX8922L and RT9524
To: Sebastian Reichel <sre@kernel.org>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	"Rob Herring (Arm)" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 27 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 00:1=
2 Rob Herring (Arm) <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
>
> On Wed, 30 Sep 2026 10:24:50 +0300, Svyatoslav Ryhel wrote:
> > Document MAX8922L and RT9524, which use a similar charging control patt=
ern
> > to the MAX8903. The MAX8903 is set as a fallback for both chips. No dri=
ver
> > changes are required.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../bindings/power/supply/maxim,max8903.yaml           | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>

Hello Sebastian! May you please pick this change, it is schema
adjustment only and Rob Acked it. Thank you.
