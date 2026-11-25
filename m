Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.214.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795615967;
	b=b3MVPJF7HuCz/pTOw/YBm6Yslfz4ndyof2PwA32AlQBAUJcRCFupuF+YzftT5SZFMczS
	 6qA6Uvrh4SRvQsNnLAjytoFm02tNLY2DQ8IhEDaJpV1PxjHaUym3bSoojkc6/sNXWB0kl
	 FfMoz0tU/IXRRnAqqhcUCWgrlOV2QF0BCgoTMQ+PqAgaYrdZlMOFlDih9vbmmy5pY22CP
	 /XTUMJoKmDOCRw1QLd2QTJMna72oORfkKngO0DMcxcqwNuOBV1k3BgNB4bZrDX6jl46at
	 Whbqbtj0XBXaVhyCVtQsoT/yjKEy+TqAZoD6p81xzjslvEUfYUXVAKfy7oEfphM8u+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=+j5ASClty8/ZKXrnqcuhSTiI2lW3GfIrSFmOpzRXZaU=;
	b=hUIPY1tzmKbk/nWFOR2y7cD5MKc6spN5Ep4k93iNsTWcvRsh06FUUGtBJBb5uISl4/ZU
	 +VPp2t7K7ywzlIPMuL3k3O+UzWocFZ3nQneGsFPGjfzy2YCerTtY+xpXfWoFEcdwcOaJ4
	 mbsk7ZrHnHMIiqBHYHUvuiH6fkYt8sI/Bao5QbnfGYF0K8NS3yKaofY+DBHvqvy7ituUB
	 BptIVxYVXz/MHB6R3PyPWpDi28rIcIcJ6XfakfkJVnPYugEaagXe+nBfcedEFdNHEX4ke
	 j67d16eISiORGi1V7Ct+YcKXmvcqi92mNR6AxhalWtxcCL/d0dN9hY3JjpT7Dm7NjlA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sentinelone.com;
	spf=pass smtp.mailfrom=sentinelone.com;
	dkim=pass header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=dDeTy2Rr;
	arc=fail smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3B1606A332
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA3B1606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=dDeTy2Rr
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2eb33b5c067so4799495ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:12:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795615966; cv=none;
        d=google.com; s=arc-20260327;
        b=h5WoFo/fdMgdBmuqcw6wgglMao22y+Wk9EGjukgJFiXxecI2+3AxfS+Js59VRPPBXq
         nodUiwim4sNCEZc4t2ufHSkVixiUx+WksJn78ouiJV74tvz1F0S7tj6XFp8Kc3wMBbzp
         qpbd6I+uTnMkOZgfgf/qc3tbrA9pBw2gtwN7molLi5QjROGNwPDVYlqAEtN8oWmOBrB9
         mGDFw/EkiGv5HAFfBbldk7Fa8muJCMHi0dZJJZE+ovVWCS7hF5GkwplX7hKbAlVNNPWb
         SM6Yo+gkr5LSHqUnPHNfTu5B0C4Z/6gNMBRJ0+FBOgoTtmBYbymCm/pYnqeO8eoiOpOx
         lnNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+j5ASClty8/ZKXrnqcuhSTiI2lW3GfIrSFmOpzRXZaU=;
        fh=ED6SqR8c+aekAzS4EgD3+pgc8ljAPzpPZzPxwm6fi7E=;
        b=pGNdsMQm7jBGPt2unYRN4GlnFc7ZGghHLM2ypob8l1zHoJIOtwJFdut0saQ/yl8nW9
         X/Png7vYmqaFGQJ7NlWiRs+W+P9Wxq0QESIRA3YfVjSPEAJDgB8wHhqlNQ2G6cJrEHUU
         1+QIdTVyipFFddzCDJMxtiHklJ53AJAAJqzWgrlBGvH1NWZw+caok8G4EKiRWlAcBdOc
         H/aHiYn7I9vIJvXUN4ntHIvwZP3ro478MQNwAMIV6ONWJh16BuoRugQJ6U0JIizaslAJ
         KtxEmc/SwzBivEontzxHGLRYagcVb5gUVSyFp62+2MfECVey5a17H17u4FF/QSAt/gn1
         hJUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sentinelone.com; s=google; t=1795615966; x=1796220766; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+j5ASClty8/ZKXrnqcuhSTiI2lW3GfIrSFmOpzRXZaU=;
        b=dDeTy2Rr9s2Rac8C7vb4lUCuu1aLkI265b3Dd6A3RHP0Tda/gW+a3I9JA8QPYMpG7o
         sp3bIVjAmhy+7kK0EYbeim0rN1VCdPk3bMeYF+aTTOUtGaixEYoQis2fVYc4opjYRUJt
         uggEBl8SlXCoz0e3l4qpT3CjggmqpDyNGaED7GbXsei9uRIUYhz5y/E35WAuW3vgUCZ/
         hTclPzUDxe4/lxgWWAyMgVzpg+JJgyfWe0ZqC6qbA8RzckHLq7tGzofGnyNaXfCF2Aqw
         i7k8MtKe9uII98rn8cLoWJdhV40HZLyxMegmuojtqRnwGeEXBxuN2I4D91JhyxjU0hlg
         2v0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795615966; x=1796220766;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+j5ASClty8/ZKXrnqcuhSTiI2lW3GfIrSFmOpzRXZaU=;
        b=wm0JDlvZGz8O+9nma4bEFlhjKHDqsBwBe5Q4Y/iOgBThRL4ltO8a1OyhZNy+zNJDYG
         USacxRxa+bZbgplzAkfn8+WYDK0etDy/PMGgftE2f8QdYJbkMXt+9HGcDHWvcss8/pAB
         DQXobKLb6YIG0036ZTDVg3YtzV4aYhGM/QADdSi7sCIB0erL10VfZo6VUZlfiCK5P9eL
         EnicDr+XFcVTlDr2gBVt6KedTDR7ynl7Zy/x6niT1h97/DAwHMnxZQt49NLCeCrMvEQ1
         OyX+8zy/tGZJCuwaN76awQxYbew6T8WMJEZizkEyy9SsYtoMn6h708AYONLfX5dOWcvD
         tmsA==
X-Forwarded-Encrypted: i=1; AL+hErHe5QthdvH41XEuMHWwrEJkj0YF7rcjvdKiZXPCdTGBYAXjx3DHUp/TffK6/tmVQPh/vSaMb8WuSWtAFEI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7cNPiWzKxFC2QykxPFvfGxG9RRDaxV9oEQ3Dl8DDS0l0A4IcP
	agis6EuJobNFOsJa6kWXp0sgmPeLQyw1NEZ7E9VLY53ndk29Y1MdtyYhJ2T/k5iX0lWZwxAd9M9
	AG8QwHQ3RnywwZgZ/a+0py2YamW7yRAJurpF6+rnY7A==
X-Gm-Gg: AZFdTZfCpH8L57hK3FyBHGtyDwnj2Y/WKweWL0Z27p4V6yV/IbxaCCD2opGcvv16PCC
	c0MEacQr7bKYjCZ/dyUfOq1cN4rq5hbANxl63E+Uf9oVpWr7ny+ceD9E8c1L3TsNVQf0NqAtYXj
	/kVs1hUjd089PMuQw6RxJsPc4EYI5g633G+6NVIavfXvtNGPPT0SFstdt6hzgSndRNP2hUriCSs
	MlWe9fxhyPfE/f02CROVxRhZaHoGgyIG3xYA8QRsHnqXQusVQlOy1MNUf9Zg33RwMS5P+QYUzWN
	cWvQ+FqCxv5oK7M49mARlZAO2dhej3E0Jxo12t2kWKMSbVrenhZvbgOupUaMLTPM3KYoudVlCUl
	BJTXd/tSWVqPrhFICxl1pYvv9gpCAgOp6mLs=
X-Received: by 2002:a17:90b:498c:b0:3ac:73c7:9c07 with SMTP id
 98e67ed59e1d1-3b41c55b914mr25284757a91.0.1795615966034; Wed, 25 Nov 2026
 06:12:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-bpf-preempt-v2-r2-v3-0-586376ec3672@sentinelone.com>
 <20261117-bpf-preempt-v2-r2-v3-3-586376ec3672@sentinelone.com> <CAEf4Bzb6sq6g7jq715fqAAaL=PNSvuVWn6u3o+76w52gsT+bJQ@mail.gmail.com>
In-Reply-To: <CAEf4Bzb6sq6g7jq715fqAAaL=PNSvuVWn6u3o+76w52gsT+bJQ@mail.gmail.com>
From: Mike Bazov <mikeba@sentinelone.com>
Date: Wed, 25 Nov 2026 16:12:50 +0200
X-Gm-Features: Aa3M54qvrNfH9VUBkNsCxXuuT_4IkvvxlNYuj2vYVSaYeAaT17sYXXVQTIxMML8
Message-ID: <CAPnbwjrkkX63T6UCdtsE0yTV0C81DFp51ONXvNOFaB8zOdmZ3g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 3/4] bpf: Check program recursion per task via bpf_ctx
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	JP Kobryn <jp.kobryn@linux.dev>, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 24, 2026 at 2:04 PM Andrii Nakryiko wrote:
> Am I missing some complications that would prevent that separation of concerns?

Not really. I can do that in v4, it simplifies things.

Thanks,
Mike
