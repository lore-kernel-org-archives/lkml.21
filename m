Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795699985;
	b=ZCws8M/5k3pzCxNzxHCPD1ropBCEe3GiEres9DfBhYRkfPZvkgog7z5E0kgm8f87HhZO
	 lKwKiwlVvH9So56AeqgA2Lw6vQqbkE1qA666ghENDpzzqz4yDvIzqm++Yc5MWRjndFv9k
	 7tPpTHmlve7OtE/kU36x9csnFPB8PIS7t35wkKBofnzGIUUNpVJ7oj5RZ+6v3cP9XwYJc
	 7nytVIK0m0DLTkbNaYSu+pThb5rH47WbPBQgU9J1PqGCR2RJV7ER+54QPYGcp/qerybOt
	 0zY4Bpccbbol6SNJ5AQjKZo3RHzOd3G8JBE6yT6fWhHZOKnopKlCJJWR8DVXSZQeuOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uxMVOoteAdKkdMTpKXTn3p7AUX/VbAmvTF8kfIv0P3c=;
	b=dWyvs1NTEZEvQTaRnIujVxmlKZ+ocEckWLk/xEfQ3y3tR5S8rxAVz+Pkgrowb+TDGV2G
	 vnF+LeARrLf0LeHCkeYbeLvKVZYQVuvF2LLGYYS4W4jRhThDZkx7uWR6TFi7X7pJhmJEA
	 3b76VvWmY5rNRzTIJSHkTFqBc+igfoxL/g5nDJipgvEKQytu2lgRftZ90inYPb1lDLrK8
	 uZydtsBpgAzZSTgvkTTd+QfqZ1ZVdpbnmxD1OQwXk2CihRI6iH2j42CxpoikfRC6iJ6bn
	 5c43n3TIYsIo0cPeDFGbId+EjtqvjYNQNjbO4Wsibf/iRMFu3F7Yx5xjjL+ggYFREtA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EVjIP0+y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F284606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:33:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F284606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EVjIP0+y
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-9495f083657so764036485a.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:33:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795699984; cv=none;
        d=google.com; s=arc-20260327;
        b=dtFcf+0mJdOM6rRH+ZM25g+n6fCDf15gIrjDqGeN22A2EIrdv2MumziAvdiSsSMpmT
         irg3JiIN1RQ2fEuy2A/3zTeGP9OKi2LU+R7WCAH3svSzTSFrG0N/jReKbfoxNcHzMENn
         +z6JPb6NWvdVmlyIDB+GpC6EwMHyE0cWps0h0bJuZMyzkjx5o3Sp/lWZbHjpPSw1N3iS
         D5FXD8/32WGiTf4nIAbOw7vedXpTFJgmFVEhDEp16PdABsp33q/Tv1jaSL+jqG/n1a4P
         ifQEuyYSUJAInpO9OFHcfY67mTdI+b60AIs5bTH8u6EyQesPs5RFApYEHAXDkCNX/ZIb
         I1LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uxMVOoteAdKkdMTpKXTn3p7AUX/VbAmvTF8kfIv0P3c=;
        fh=f0sJNCiWfVQSmZI1H5bwEJ64h0c/8PqIkDwf232eFVQ=;
        b=I7Mz+fmq3Fnpd1hh22rQWYbnQDu0CO+UvSVZBl0/PGq2o9opqqrrJmh/aVbFd3Klo/
         z+01SDEw4uLfkq3CL0BZiK+maNO+vpgY8pRTlS3PN3c6X2aZHW11cv5Q/Bkinj6dXiv4
         kEVRyetax4jamHVOcpmbca6Mc8MMiZ75X48deoPAQn3rvQKYfpCDMRQN1vtpwn8K/vAV
         hyUJfvjD4O0CBiS5iGwe7+waEwoX8LiTXQcygEe+HYiqkK3qcoQIUeWGpN4HKRu9mtYo
         owlzUk/moeD0BqjLkmFYTj+5ljjllU3oce83pTHte9Hh4P3uLVOPSfhZ8QE9vt1yAcdw
         S6HQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795699984; x=1796304784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uxMVOoteAdKkdMTpKXTn3p7AUX/VbAmvTF8kfIv0P3c=;
        b=EVjIP0+y61KBKgF/ViTjIrw/AMZy4lCeCmifulp1Dk5INX85m4u027sxenWwZ7bi/n
         4lvUmeNuPQcDP6fCgak+KTsHLcKHoQoGBSzJ2yg+MTUzy+q7Ld3O6RZNS7n7F/wKNlVK
         lgScGjExe6q2oAx+7pNB1xfjNdWEqTEXkKhHeCDAJngkABVyu1Faz/t6kzR0AdBbbJJf
         iI/25b+KBRKm3bqfA9roTZaNHs29OepfnBOgFo9uL8GYE4gp3ZwPYALdVTITJOpLUkoc
         Bsp6E+mpADVOcGu3ng5wZjdjnJLCX/JwOjH0BgXXEDQK+DcZM1tx8ap0ERiAnMdplzZf
         ssWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699984; x=1796304784;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uxMVOoteAdKkdMTpKXTn3p7AUX/VbAmvTF8kfIv0P3c=;
        b=UxDFHhdsovjhXC6/mr5PQLGSdoEXriCr9b0FqGGZyULnElBOQabqKM8NH88rKtir90
         kADRyOuCGzCEimTko0hJiQ4fPVflKwun8Y6tmdWwyeVqRLbjGmeLALYanu2mKE0sx2mH
         zt4klNA9vbSAD0A+xXjCS4mfqQJnwC3jSnIB/tHdA1J6Axp3tNxo1ASqCfwaxMY24fnO
         sio/xEvk35AEzK2b1SF4TRcN8QAz4QHOdiHEPUJHnGqFdzwbL6O3J3c8a8kr5OZjA79C
         OI0GO9vS0KQVKLJdqnmAIL45Cj0l7WHFzTjH2TKCzjeB/XL6DQHdhfO39RdNUWLN0CLI
         vaBA==
X-Forwarded-Encrypted: i=1; AL+hErFpPXBn9PqWtGMmaXI6PStZB/PYEglZ0FwioYHKyLRheE2Lo6k0ejuEwg+a2/aiXm2rFxTSK52unW8VCEE=@vger.kernel.org
X-Gm-Message-State: APuU4Z99bzKOHHjbi6vUdHkFIjAuzxo6z1szH/J24gU3K3pexQ4nn6JD
	mVIOzynpKn/91SE/l31u2VteAt/35gTNCFgUWKG+zyTj+62Xw0x3UkuCKdGr+MGwSrOEw9hhIk4
	OBJZ+OOr5Ng4uYp4WSF2SAI/+syt85+g=
X-Gm-Gg: AZFdTZeU8NgxDjHPhLsjX/J3x08MXRFB4kfhyLN3eggEnGt7W1aME2+9B5STaJiT07l
	YFK/FN0W6bP58eSZIcBdECfUl1FFHpp6sZ0w6rPCIdyFVG7HXR+duUshv2qmDNmULNUVdNLrDhx
	/sbDxhote5gNhMPfaMXe9PKcaXTsh07ftFsxpIqD2SOoLvgZXuQxMFVdKEdYPttiYZE6w0bYIVr
	FiWJf6sK0Biq/iwSP0IyXhtp5hrNcKEdzQiscaEauJt2AViXvutBrGP+u7ayk7NOca/LDu2zkQT
	j33JsE7fHJ1fJaofWhPwCuY9oT32knWOdPBjSAI4tSt9tdiRCcf0Gi/T7EjfLf3WtmlnQv1BM9j
	d8S3lp/pihuw9NMG2JROCnwR7zFGk61mS8/60gG1QpP2y7EthdB40ctUgJford2zQAnhmp2hDkj
	c=
X-Received: by 2002:a05:620a:f0f:b0:949:57b4:388b with SMTP id
 af79cd13be357-949bab0eb6cmr4001700485a.41.1795699984091; Thu, 26 Nov 2026
 05:33:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126-a35bb25eb5-u14-0@mail.sdu.edu.cn>
In-Reply-To: <20261126-a35bb25eb5-u14-0@mail.sdu.edu.cn>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Thu, 26 Nov 2026 22:33:16 +0900
X-Gm-Features: Aa3M54qjjDisuRhSq5dw0ZTix4ZhcjQ6ZVqggl6dEANkCNo2yjka_biV4TPpkKs
Message-ID: <CAKr_iV7eXh5LjQS=66mfGFA5TAX6Ke_cu58eR89G9+vjCuDw3Q@mail.gmail.com>
Subject: Re: [PATCH 0/4] clk: mediatek: Unregister apmixedsys clocks on unbind
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: angelogioacchino.delregno@collabora.com, sboyd@kernel.org, 
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, matthias.bgg@gmail.com, 
	wenst@chromium.org, drinkcat@chromium.org, weiyi.lu@mediatek.com, 
	msp@baylibre.com, fparent@baylibre.com, linux-clk@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guangshuo,

On Thu, Nov 26, 2026 at 5:31=E2=80=AFPM Guangshuo Li
<liguangshuo@mail.sdu.edu.cn> wrote:
>
> Pair apmixedsys clock registration with removal on four MediaTek SoCs.
>
> Guangshuo Li (4):
>   clk: mediatek: mt8167: Unregister apmixedsys clocks on unbind
>   clk: mediatek: mt8183: Unregister apmixedsys clocks on unbind
>   clk: mediatek: mt8365: Unregister apmixedsys clocks on unbind
>   clk: mediatek: mt8516: Unregister apmixedsys clocks on unbind
>
> base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5

As ChenYu mentioned, my previous series fixed these issues.
However, due to my insufficient verification,
some regressions were introduced, so I'm preparing a followup series.
During the correction process, sadly I found and fixing several bugs
in MediaTek CCF, so please wait a few more days...

Best regards,
Akari
