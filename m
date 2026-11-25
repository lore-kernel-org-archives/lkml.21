Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795570848;
	b=ccjIP40IIs9rMAj55LaCSfo/JdoFOc74+sjJagim9cwcrAlmJvUs6MXT6obqRzaVIRkE
	 mSuh93owyprO0+glflkoGWatzSchvt/3UhOvTg9L3vY55A3uYjoWtVirlhz6uAYed75DI
	 iHID6KYu6vOQRwC51ZFP5u42GKkhYxDtdMOs9Ki4roLNtQt2ONVeJJM1qkwdKnOyDEMba
	 RnzOE6lTnC4Qv1CLYmkMzji2/0HqtMuQbLInJArmWasZdt3Sm+pdYDiS+wcvxAlGOfI3E
	 y8945W9AfczxBMnL8VtSplCzYEVB6xPKZFSJDmc7H2TCBocFXgEiNxxkqgWDrGzM4dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:Cc:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=lMn+79+xRTKct7sDQLtayoqfdZDNWSUiec9/f2ZPH6M=;
	b=A51SHm7lVflsw+j0cmDGeXVJ2qbcbQk8s6x8bZ/tcNuXuNY4k3BU+Zv+uq4DnG7P9MyN
	 EppHiOPg/0s6d4nnGiKQL9ERt29cPpiCJJLF2CZnnRMV9yWiGOlFA98Gad0q5PaNImaoM
	 hV1NEITPRW3H0JTWlicSHQeLF46T91cd6n8z4SVSli/p6vXj7J9HHQgsBkT13LxMh2xuT
	 SCX3trcOCwmcgR3AKsgRRbjIZi8hAokdj3RWKydLFqVmAM3NOdiU8rMioeM3YPCPMP6gf
	 1oJfmjYvh4pDaTL3A+hynoM4C/5s83q5K8K3F1ZGEN/MZGP8ZF9eNDgEtZs02Y5XYtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aKLVcUCW;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728C0606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 728C0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aKLVcUCW
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b49a6e8212so1642227a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795570848; x=1796175648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lMn+79+xRTKct7sDQLtayoqfdZDNWSUiec9/f2ZPH6M=;
        b=aKLVcUCWjaGLEkL7rE62+5x2NfqZS8rT3GrXE1OUuvzR1jZo08MDOJR+8g7o05HVVv
         BPS1pp+bDADkiU6vd90PrPz0d8dlGkasYu+Li/MHmAmtoIIwkGKfIf0fYOHnFZFEPMx7
         jh9rKU3tyg4MXVP1vd/WfX+vAaYthqeW0uPPFBMrCsoIylEi9WHbFVx/KgAM9ksOCs2g
         Uc9VMXtYMqqrUSM7cO6VY0Ny6z9WH9fyAfVJO4ZCY3egMNBChA0EEwZKwbKUaAnJ919E
         9AL9yCJWYjp33eRSEFPeNmvGf+Dhy5/3IlJ9zIaGNz/tj4G8aQQm3KY7TVxsUImztWbq
         7aOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795570848; x=1796175648;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lMn+79+xRTKct7sDQLtayoqfdZDNWSUiec9/f2ZPH6M=;
        b=G52DmO7hUMjLi+38TTH62EQQ2a9oybWJruXUtH2bVS29zEGiZ1zfIisE/+LEUs6UQf
         JBDpzcppTEyE1rcRPnlrdBUVcPWyKIKQWEzZHAzuMD+A+RHzo4lMczBRsjhHIdEMNmwc
         LfghScO/Y9MW9fedhrkMru+Tpt4ivO8Ak+uAS51UuNXETKOm6UvQ9vJENgCG9brrFwL0
         FN4v4jiBvn1bXKoFGRCjqrpehUW/HPXsrV07C91t5cseQpTwWW5gcfArxDZubBJZxmzv
         O5vZ4wMmBKgRiEZuj1iuGXuQViEui+1rdJSGiZ/zaMpeHgJBAxxKi5s2ios8yTZHaYXY
         vTwQ==
X-Forwarded-Encrypted: i=1; AL+hErHEJKg5aV0dp/ulbir40P4q5AHzQjGEe8xbeBLPGHyNDhYYE47WBeIvyItxlDGq3YZV9SepsqxU8zPYtEc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LaBpFbDxsCTqILY2uN+yxAW/qtltOjBGd9gBcJBSslOhOQUBL
	77K3HwPpTB/l7AVQxeElI0P0XRMIvB1UXkIbqT904pVXfwowYQJO1JgZ
X-Gm-Gg: AZFdTZeHcNn5/02U5uoqSnpBqR6ZICxWcxdR6zLcORwfibvI1ImMFqtB6wRz81u3TDV
	Oz3S+jAn26ABEQ0d+Mc/UEb5BzTHyoAWHTnGk3pNEGLyrrAXP623m4EntUJGa9dv2C4WrUJ+SlJ
	Qj97L8JfusqenXsanPTfQld75/NOuEJyaZui4JIu9dkM63bF6hvC0tZuOWLk4lSRBQTCQqJEsfn
	I8D9A8uyP+9zsRpfrOG+72BBvWOf+K+3KHq0KxAwkZWJn0EbRfPYex5XQCFKwRXNU+KSFlX8VoP
	Wem0IRm2MkzY8bXuVsZzOgKZ81DO0JVtWS3+2qtPbIMLaOsfbMfq6TwUeyRYeVEyCyCixj/XHAY
	b0U9Jd86iH9Hft+2k8NK7D6R2+mD2h6PZjSP/corTqylPkK1nm7t91J1NscTksUBmZs/jtom2AH
	LPiaeAUKNzgBpMW78hLmW4cDX8mllLvzhjvGuEZNe0+ssRA4CF3Angc3rEtsxPZICFmOyWpMch4
	KePbXEL2GAId3udtRiO/VGesv+GraOMdTeJO6xRH3w5R0zSGMgye2NBABglKrIuNXG+H7ANtmXa
	6cxV9IK9tH4B/mou0Eyt2tKLpDnzOA/KFh7ZPhkOD4csEtIAstfqp9VOlgMgK+BCcldloz6DDTc
	4jjfS
X-Received: by 2002:a17:90b:4acc:b0:3ad:ce34:f63c with SMTP id 98e67ed59e1d1-3b41c9e4b1amr15908819a91.30.1795570847756;
        Tue, 24 Nov 2026 17:40:47 -0800 (PST)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4b3c71192sm8761791a91.5.2026.11.24.17.40.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 17:40:47 -0800 (PST)
Message-ID: <8c25cc7f-5c8f-4bb7-b82f-0f2d1933e334@gmail.com>
Date: Wed, 25 Nov 2026 09:40:43 +0800
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
Subject: Re: [PATCH v5 2/3] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
To: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>
References: <20261117082832.1551574-1-cwweng.linux@gmail.com>
 <20261117082832.1551574-3-cwweng.linux@gmail.com>
 <sashiko-outbox-218423@kernel.org>
Content-Language: en-US
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, dlechner@baylibre.com,
 nuno.sa@analog.com, andy@kernel.org,
 Victor Chernyakin <chernyakin.victor.j@outlook.com>,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cwweng@nuvoton.com
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <sashiko-outbox-218423@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jonathan, Rob,

Following Jonathan's earlier comment and the Sashiko review about the 
internal VBAT channel, I'd like to clarify the intended IIO channel 
numbering.

The current driver only supports external channels 0-7. The internal 
VBAT input is not supported yet and does not require a DT child node.

Would it make sense to reserve IIO channel specifier 8 for VBAT in the 
binding, while keeping #io-channel-cells = <1>?

External channel specifiers 0-7 would continue to refer to the 
corresponding child node reg values. VBAT would use specifier 8 without 
a child node once driver support is added.

The current binding also requires at least one external channel child 
node, so a VBAT-only configuration would remain unsupported for now.

Would you prefer to document the reserved VBAT specifier in v6, or leave 
the binding unchanged until VBAT support is implemented?

Thanks,
Chi-Wen

