Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795123547;
	b=a5cWZRk5UVkrBSv0Prq+1DKsyA408kV8MQLoglz/V4X3uVPsAqt0KYBCwbitO0gxo7HM
	 SResli2XeKIZSJMyILJpZlzVbM+EUHaIAIcuZ2VIbtUAqmy+ebEjPQsXiy20KgdjaGux5
	 4Ccr9JSEJKVUj1aOz+LUk9pkKduZFpnhe8cD0tTGmqibLXFFAGNEL4kg9H8kSlmLyB0p3
	 e8nAW+oQuM3IggmEa8KDTBC72z+r4vmJmMXYcz0GrePSEQL2+rPeJWG/ufVXv1vWCi8Cm
	 N2v5UbKvWrww7h/CLbBHJJPbxYABhw9zHjeHExnXFcZTCIaaM7qPq9MS9GSZ3Ryf03g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=L3A+83a9wCzT+86gHuUpOEXepXCJ0T5thB6Rt4gPEd4=;
	b=NPt5f6gwex+PWdCkcaop+WIE1CTD3onsPahoOO9X0gJXO+1IKIp9NIrgBhgBiCQSrwiM
	 uddmKg4P13zzRD5JgGOGc301jqgpwreeDk8ii00kBpkXQaFqLKNg3IYTy8zqoKZoE1539
	 uL4HC98mE7yIOrBbcjhKGboVMwrpxihj0DlZtZGXJgeqNSrQgNyXcS797Ss+iZLUf9sM/
	 azK2PnDeIqSPUasrKkXs0FgWiRcYVPRAgzkG/n4E11RpRi1m39I7YhLnsRxkVpSHCMfFF
	 CDHndv3XyxRSoVcxY5dkNXPOeGXTpyKtVuv4PwTSyg4iGzWr/tMPoVsONu72fWJi8pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rEWPSsQJ;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A70A606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A70A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rEWPSsQJ
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-55d03bfd477so2564471cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795123546; x=1795728346; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L3A+83a9wCzT+86gHuUpOEXepXCJ0T5thB6Rt4gPEd4=;
        b=rEWPSsQJu0DHzGPnHR4fUNkId0R/vH5k8iuqTieO4oFRVN9Wr6bJ2jRdJmRWIIp034
         U67Ce3A3De/ZQfiK3F70I2Izmn+Nh6u0X0rU1isSDp4b+RNakUt1fwNgRz4GSAE8nqcG
         /c8hLCmmJkjIN6Pptt6iTBvye4W33y8thEPF6arbiZ6rfpFL5jBGBVz+KMHLUdt141NX
         32EjVHbeID7WYgbEi0z2Q2pY9M5McaT8cSEYeinFBNl5SbO93aT6Iju8ucwg01mVLOl0
         X2pOMMLAt6q5xhSqpKbaIE4PREpMCtplAjqgZIZGvsW7Z8S3IRRmmKqUn0C4P07IAds4
         eyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795123546; x=1795728346;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L3A+83a9wCzT+86gHuUpOEXepXCJ0T5thB6Rt4gPEd4=;
        b=mJXx06iDFsqP0bTBsiTciYu81pIwDsPue3niFSH0T+MHj2GUMvRtIfnxmba3TIk6vA
         fKrQYP2wRgSQyUFzi0qa5+Kw5h0eiQoNd/iq4qtxBALOXXhrMm7edVNdfbgk/3cwTV/4
         rxYIV3qF818jsqyy/tv2qU3RFe2g8UgxM6du+sSISYwxekWEVvM4jYEcmp1tKhpdzZgD
         3ZNU6tsrc4UD7asgHcn94fkrpTPsq92WKOOXgcVAEYZ3HhaUdgGyS/21rTWSDCR9pTD7
         o+weD+LS4fThqrN5UuKsgWlTlKFjQet/Fg+x1eSO/cns0YJvC/TJPM4d+utc99+yufMq
         yAKQ==
X-Forwarded-Encrypted: i=1; AL+hErGBc2Xq+tpSl/lpHNx7Rr4xdMIGCoNJ2jtMvECca3i4qU/ioOao6dR4YqfFZcNKs6roMmWUTdDjkmCSrAU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wXokeWRCdyFBwfHXdZOlAwzB6c1PqKYTDOFK/DiUKNgQCo+jA
	+vo0oPbpO8vMEnIdukEsTPvRRujGT6iNCByITJbueK+jvML5vSlbZLCt
X-Gm-Gg: AYBFou2jBMvBLr2XxoM80dDGVA2oGDqXcuJ7Z1QOap4suTAdRxe4GdoPyOkM2r110St
	Z/TxfPchbq1mncTsDkg4KC2Tz3BunTRoGK03BCBGi2IU/FG2DLiPmxlO7/5butCbNgkk9hyIFaM
	LIu/KqOFffoHlp2G0DOSvvfhILlMg0hmKFSAylrpkGA50uVRMqJMSwktXFlURcBbsgEHhPIsIdE
	IjcVc0yqWXsVuvCd7hsv9/zMVvH4IQIMNenuhH5GdwjTJPPPs0Mq00Y+PzWCWhVr0b+MV7JcJ2c
	qABNGW01LfwDtrkV/7jf+10oCcphd2wrYH30Om2z83W6oDbxnyQ2yNFgNGTyyblcS2j17Po4eXh
	cXe3min+tfcXGOK44npp38NuSRk1P5ii3k5TGmuAbZRRYhZ0pPD81toMEZS5+uPTkn8r76fGWaY
	9LYXyexmQpLdi0JvEtiGnMMhI7XlwpEJyjTf23LtZ7JR9F6S2zpC3suaXeNLQLN+58ZwueVcCTG
	CxqPZ68y8IfnSKWBOjHu8g4vBCIfQL8xfzbfwrrB2jEZcwgOB0lTfClJMd6w+OWPSb/O5eP7d/5
	tyyN/jkRWB4iCkEWiZVgY4bs5eMJvHVPlHVCPc7CNE/HMTg6HRU+5HPi/EcO4amf8fYdrqu3Zwm
	/LaN63Jrg9AigkT5WiScRGAt3+RchM3OMGzJy1GD1gfdWazig6yfimZbRRr/HdPS+UeMRRD504o
	G6sLBjRpoh
X-Received: by 2002:a05:622a:248c:b0:55d:3669:e04e with SMTP id d75a77b69052e-55d76a2b7f7mr22004751cf.22.1795123546011;
        Thu, 19 Nov 2026 13:25:46 -0800 (PST)
Received: from gmail.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b253csm8744006d6.15.2026.11.19.13.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 13:25:45 -0800 (PST)
Date: Thu, 19 Nov 2026 16:25:45 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Sangmin Lee <45sangmin99@gmail.com>, 
 netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 David Ahern <dsahern@kernel.org>, 
 linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Message-ID: <willemdebruijn.kernel.d6d50443276@gmail.com>
In-Reply-To: <20261119164351.49040-1-45sangmin99@gmail.com>
References: <20261119164351.49040-1-45sangmin99@gmail.com>
Subject: Re: [PATCH net-next] docs: networking: correct skb_shared_info field
 reference
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Sangmin Lee wrote:
> The skbuff documentation refers to skb_shared_info.refcount,
> but struct skb_shared_info has no such member. The actual
> field is skb_shared_info.dataref.
> 
> Correct the reference to match the structure definition.
> 
> The discrepancy was identified with assistance from
> GPT-6.2-Astra (xhigh) and manually verified against
> include/linux/skbuff.h.
> 
> Codex built the affected page with Sphinx and verified the corrected
> field name in the HTML output.
> 
> Fixes: ddccc9ef5599 ("skbuff: add a basic intro doc")
> Signed-off-by: Sangmin Lee <45sangmin99@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>

> ---
>  Documentation/networking/skbuff.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/networking/skbuff.rst b/Documentation/networking/skbuff.rst
> index 94681523e..e66adf19a 100644
> --- a/Documentation/networking/skbuff.rst
> +++ b/Documentation/networking/skbuff.rst
> @@ -21,7 +21,7 @@ to as shared skbs (see skb_shared()).
>  
>  skb_clone() allows for fast duplication of skbs. None of the data buffers
>  get copied, but caller gets a new metadata struct (struct sk_buff).
> -&skb_shared_info.refcount indicates the number of skbs pointing at the same
> +&skb_shared_info.dataref indicates the number of skbs pointing at the same
>  packet data (i.e. clones).

small nit:

    The `&struct.member` syntax is only converted inside kernel-doc
    comments in C files. In a plain .rst file the `&` is printed literally,
    so the HTML shows "&skb_shared_info.dataref". Since you're touching the
    line anyway, match line 18 (:c:member:`sk_buff.users`) or line 19
    (``sk_buff.users != 1``), e.g.:
  
        ``skb_shared_info.dataref`` indicates the number of skbs pointing at the same
  
    The :c:member: form won't link, because struct skb_shared_info has no
    kernel-doc, so the ``literal`` form is the safer choice.


