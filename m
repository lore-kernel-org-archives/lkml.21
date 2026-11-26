Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795708356;
	b=gKH5riocMtDfjyt/VGVwnClpBhBMNHMfSh9uPnuy25sa2BV4BBIlw9JGG+KojFAkYGX3
	 E3R0Y9JLRer00qpyJN2XKhFB5o/esPBjGgQPLt2ZKG+cB8VXIY3+JltDfvsB6xBQZNtCb
	 /3MSZlN/5ZUKEJmB5cnY/EUMMmOZZTkMWdMMusbvhg8lbos677A1U5oi+fA1dd7bAtS1C
	 JBTwbPcIhrz9g9rPxk3X8Aplxhmyy9xe2nK6PuwDPXrU2cZrhgP21A+zWmVwVEbWnGLvp
	 /C4wUS8EL5mhcvMNAmMbNsQ8Ll7S0IDxaMLI/rh2H4scr9PJAoufZO4aiEohBYmszvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=D2w0hKHXc8bGk9pLlhEwY2ly/Cum4D8Jlbq58Lw0Mh4=;
	b=bsszfIF6I6vRm7UsbCxw5bIrD/z3x1nohgrKsbt0ApYO6XJel9EfqmjMb0fZmPEvkyme
	 5C11/8MtuzCGaLKbnfUAT3Q3NIopTIkpCTc0YOS3Ldm3orbFNoq3IxFmaNvgbCjmRvhJq
	 uaHIw5b9GTNN3gcQDRpcIFYRYHa4uL6imJDoPU0NqvjPabQQV5EMipGIciGstco5HmfdT
	 /hrSL32I+wmApsCsncl2IvXbQSNqFsac+/txtZFVxU3UKpr+TM6cmBH5oPt8ALsRgZ2Zy
	 Gwx7ehi/kohfWW213/ZQkmNbGGhwMR2Rs8Rpeoky+Nf3gjBxwY22yRaLocL2/WqnbfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vbUr8sYj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E0E606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8E0E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vbUr8sYj
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-38699cf08dfso8778385eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:52:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795708355; cv=none;
        d=google.com; s=arc-20260327;
        b=lwhwpa5kyhpsk9VVL2e2ZJDH46UAEd4ryf7TbYJS7w2WZY1MEV1iBptwkUV9Zzhoxv
         C3Sgj9FqPjGRXNebbF+uL/apiK/jvSo4CcmS5n3M9b28jPUfhFe8g7dsP8TmS0xFMk4f
         hl+27drnLQRalUBRy2YVuzfAu9NRWoTbk4Pg0QYBxG5J/f+uJZpIkWQwSfMVAdBp3Me1
         bSKzZyH2zkSrTQH8CCfWLwA0ZE10PbftPsZo9XsN5C8HGc9HDFpqSaBdiTl3uGWcDnNe
         Q1fOOhFA8wCTzdLvfVYy5P6laJ7VBQsaOejd/e1zi3Bu0Kux3OkHWe6EZ9b7DhYhxNmf
         txtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D2w0hKHXc8bGk9pLlhEwY2ly/Cum4D8Jlbq58Lw0Mh4=;
        fh=nE+KjA+wvlGWq6glSk1kVqo1LBPM6XR6BIT7ZNO2/TE=;
        b=bVzoNyH5UP4XuxgVh7qXOF9EY7RnvH37eCzEph6a6F0z3Q8U1BTsm9WLWn45WevKK4
         q422oC8TcQ8XpNrz+iL3U3vMwf+0YrC7wcLU3vZNZW6w//ztYQf/F8U7kskfQvkoWvtr
         sR37ojf02qNOU/EHCRlJ34dCuy2Bc9Ih55lpnyHOqg5L7rLbYH12fsSIDeKpyQVotlgW
         BenGcmcSzvqxxMt1AteAF9QgMm+f8N6LXui+mheT5r6Tp/V9ZsyNGPKPWertU/q+dpcm
         Wgo5PJBXBeRM8cnB4nzFxCAFUIwE19V6yjLuGpN4xydABfPOt85bNl/wHEdEvGYU2pEa
         nBqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795708355; x=1796313155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D2w0hKHXc8bGk9pLlhEwY2ly/Cum4D8Jlbq58Lw0Mh4=;
        b=vbUr8sYj+6w6aQJb8FXk0OrpubZlXupvHF938s1OkK+EzF798QEfaWCZACZGmfPEUE
         FljYK2YDMbRbTtt4D463cFgs/SW2IDAmqaAZerwExV3cBTCv1iE8Yti1ketbrHQZOs8L
         RPTkl68xHo6xPUZZbX4XwZ4JEd1fBuMwvNvFV674xCbfTem5IRov0WEx4qQaYwmHk7U3
         7EuSkPrQOCnkC613XUqI3Drz9ubLg/WIfeqwnkLo8eGEo5ZnOsYsBfUVem+Cntfc8Vt1
         SvUQjV8plFoXFZz6MwwKb454wWDgR3Wg+QPBRj/9v2KyIdbqqAX4UGtH5buhWe7iz571
         BdiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708355; x=1796313155;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D2w0hKHXc8bGk9pLlhEwY2ly/Cum4D8Jlbq58Lw0Mh4=;
        b=TwHK4AZPiR3bU3/4EINXCKY/tQlbqmc6GO0CMY0OQjzz9J9Eq034M7LTpVsdC2+7b4
         XC3aCkm4gcGHdFecFE4JYw7lfeKNbFn/0HRarWmYuzX4vSYjwlbNCCYs6M8WD7VxZ6FG
         MsZhf91aQ/YkdcuNcdkAQEsOqcNVPkhM1X+sPPbEovIzo+YCF1ZdCAihF/qvnWnX06fh
         KnsxDtkUyaUnXcgPPg4h9TPf0aIGcMHEHQL/GWqbxt7cN4vWjPJDuMz08vhIkwch4Q3Q
         4pBfD5ffW4O2zfeKA+n5I4krY2YJ19Zib11vIq0VYSY1bRo3pBOUyaYOuNhTUDOj7WcO
         4+dw==
X-Forwarded-Encrypted: i=1; AL+hErHRtwEI5TY7ckNILXTipv5YX93tMIZEb16+qF1xtatV8HF2ajjn5pMmwc6sx9f+h9EFzQZGRTCinR8M2uk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0d+kEICHT7WHL5YgleR1/KPfjdFoFqBwbO+rTy/tKlkM9mOXA
	7WzQ4Wbtp7KYPo2JZRUcvqkFUukz+N9w2f6sYBDu+Ptd+OJSmxbY60Hbkbr1vo1dtkzlFb4OyXl
	68yDKMPaFCseVriWa4j1n5AZE/Rbq1JA=
X-Gm-Gg: AZFdTZfOedc6m+cuKkYdy8r9RIGVlNNuOWJ4QekC6sWyZ4x36teIKfQQKfxstqcg40e
	QqfrvEinqeFY44Qn2phAhnDDEBfuTHeTe/eZe+BbRVEBBNzHLWdHXAuw6InXdC5+yR0SbCDg21N
	8QOtc2qDXWpTRYCpL91K5kez2GN/QBG01W5IgPFmfqp+tW0UdQ9vTaN3m0tBfAJKSUTULRN/J1N
	Fe3xkH7Kjw0VJSV0Mfjzj6YTVLMRoABkbZPmQT15TEoSQ0v3w8z1lAQjMAyURtYB8j6jCcPVNuc
	L9gJMOs9VCeigf1F7Z7VeO1EY4NnhfjgICKmaP3jBqHt9Z9WR7FwuB2Xp1EYeb1FVpJOsvkq6ZN
	YdWLMMH8E0WmvwZEFByQN9eG4YclXZx77C9lR+5q/rYSQ1DF01KOKjUzzYW9dwDSf/mszBdg5KG
	/0qVPURa0qQq9YSdN2XhdYyMPXnzIkr3U=
X-Received: by 2002:a05:7301:909:b0:386:a3fe:44f3 with SMTP id
 5a478bee46e88-386a3fe48d9mr16927412eec.4.1795708354752; Thu, 26 Nov 2026
 07:52:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123150224.199601-1-clamor95@gmail.com> <20261123150224.199601-2-clamor95@gmail.com>
In-Reply-To: <20261123150224.199601-2-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 26 Nov 2026 17:52:22 +0200
X-Gm-Features: Aa3M54rc_YffzEFCwnfkuVALbinO-hBCm-HlGDzQA_xhS0kZ8JcE1X-SBdlekrc
Message-ID: <CAPVz0n1GzY5BJLUZrdCgJHrkZ+45Kix7VP05EJeiY5FVycwKBA@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] regulator: dt-bindings: maxim,max8907: Convert to
 DT schema
To: Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Svyatoslav Ryhel <clamor95@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, mfd@lists.linux.dev, 
	Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 23 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 17:0=
2 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Convert Maxim MAX8907 regulator binding from text to DT schema. Reference
> to nvidia,tegra-regulators-coupling in child regulator nodes.
>
> Acked-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../devicetree/bindings/regulator/max8907.txt |  69 -----
>  .../bindings/regulator/maxim,max8907.yaml     | 283 ++++++++++++++++++
>  2 files changed, 283 insertions(+), 69 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/regulator/max8907.t=
xt
>  create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max=
8907.yaml
>

Hello Mark!

This patch is prerequisite for MAX8907 LED patch. Since Lee is quite
strict to what he picks maybe you can pick this, LED and ADC[1] device
tree patches?

[1] https://lore.kernel.org/lkml/20261123150725.212836-2-clamor95@gmail.com=
/
