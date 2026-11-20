Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795135570;
	b=qWrHPJlvpJBDscv5VzsHRBc1EnasPmJR+9KoWuhcj902PjB0my2UtpLuYAleq+pZ/lBe
	 yt4BEiNE/05xhpnkHbpuk7+4y9IqnMqBsMkDsi+h6K3HAVZub+hlKatwDkn3dFt/blPAm
	 b7ofL9DubH9Nsco5ZzFuqrWTnUlQbpxHsqdMMINKV0M5HBK0G4addcoB4RZ3W77nFwSo/
	 w/LHiG2xvv/+B8moacgQO7D3rjnkENiDm2/dBVC4FTKi7QaY96WHYAoJrvcZIAgKaUYJd
	 GYTQssWZZF7OyjKxyc6TcSO0tcZyWMpfIkvBxbQSBZ+IddLQK4/NJK3a8blVuUUBZIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795135570;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=0Wk1fOxDDLV4UZ+GtYR1Hq2j6HZ/VcU5vNNYnE2q0m8=;
	b=5KYbrJETnjg6tQi40tb3zhQ6K5/Zdv9QjNVmXRQ40cyPRt6HaiCMmGRjUg9bTauHZzV5
	 y2CRqIecC4b1/RW2ilp+fKjlx0W3n0OyhPDiyGbO+593/79A7EJ1vbGKiYxvwQuHUk70r
	 tvLm3gWZLYqd1uDuG6FZkYKuUUicLDVwGZoOHDMjBib793litWcxjlPH34r/bZWEb0iZj
	 N1SYdRHf0gD6N5Ahauy+goaJpme0cMVTfpmP/70VPc+8tKCbxRYpY/mvrs0Op72EJw3yH
	 ZJwmPkeAJiVtX/wGODLgWxYHt7scccTuDdiRGXJLsJh8Y2ZGu0bkiEubTmQiZa9tgjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=NV6sU6jJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BA3606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4BA3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=NV6sU6jJ
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK0FLLM4019833
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:46:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=0Wk1fOxDDLV
	4UZ+GtYR1Hq2j6HZ/VcU5vNNYnE2q0m8=; b=NV6sU6jJZ0mpnUMoIb+pL/HH7xK
	a3UwfYHXKTyMkhahfD417ja4OfWndYESuBDx66rnAVDwPlQLHoHTC+PUnUzHSyNg
	EB9BCAch75SL0RfF6TMsOX3rsu6ySgWFdV1qO1pjkotz9t14GvdoSy2B1VQ824cS
	I8U8XdHNz9p6hG55YvQrdcpQUsH2Ha5jOuqzB1secBKPU6nIK3jqLOhVT0CGQv/C
	dH1uV/DXEjr0ptmtWBbWrdSF0UEPWiDWP7Cu+3e0971fV6/i87OrBnt0iVKDTW+l
	Jnk+o5k/2+7A9//ciWeuLqSmYKAeNlyay0fLuty1auwFGXnBKk/YjVP44yw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j22w75ca3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:46:08 -0800 (PST)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-89f84753b43so297571b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:46:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795135568; cv=none;
        d=google.com; s=arc-20260327;
        b=d4DZZNnHM9NIMCLnMHpUQqoP7p0vcrT+/Q3n+5WFhSKzEX8yFwgyzo4gdDOO1E3tzQ
         upW0XFr+e4t5QzRkabXLipn3Qx+GzTw/BoHH8G99F8rt9AhluFpLS9b1zcgL308Hg2RW
         O1DxXJzyCmCOHcu8qcIEU3AN2TPCTGI3i2o4o2ZdJb0iK7yNWVOBkIrS2NyhQd5DW4U+
         lLayvbZiA0yocn8fQgSG7UHb79AaGRyFZIDi7/xq6Aox3T7QIqzl91jMBg8gOU0ZzrQU
         8BI+bVvUf1C/S19c01NyTqIneY2aaPpTxSm9Niks9KOqXPU4DFnb1jCpOpwn1P6qf/A6
         dzXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=0Wk1fOxDDLV4UZ+GtYR1Hq2j6HZ/VcU5vNNYnE2q0m8=;
        fh=f8xPE+Nizt8VQlEFyxmkCbMjizwMD1gOPhT5vEkB4S8=;
        b=M7d1a85mx4V+bra3K7IdFygvKmapbNQtntZrUAj7eet4d7ADBEPM+dp3ngpXkiOLZu
         0ddaorAdwlSmLil1H8v9IwbPymdlqJNM17AXoPI59xY60MM42bsMu+siO9Yjjn5O/H83
         hfGHqBFephQLI9WXXLqd6u21cbp+r/qEKNPZAggEd1QvSnmYOf1+BNIhX7JFWwFL/RsD
         7i51LoXV3P0+u0jqE+v4BZN2WpGYTmfc4gJB4LIEWnLRF257nXQE7ZXeRPyiuOCvXmLm
         Hr2g9klaV7F0KU9yPpXLvU4CHz1awOEUb/ihv/gSdvLh2IJ4Y5Hl9e8EwGLNQHEAHzVf
         bilA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795135568; x=1795740368;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0Wk1fOxDDLV4UZ+GtYR1Hq2j6HZ/VcU5vNNYnE2q0m8=;
        b=TGPLKvHnLcqJe29pJscW5aZxNbhHSy0RgTdDcOd5pxoH+nGvqiwCh4pkl8FZUAJZ22
         0e62MUUHxzAHMBhFoYCVAoViaYDhIrLUms0YxIR05zbQ+RqV23vOoc0HCioYSllbXOUW
         fkxJv1ZpYe8eJMMF8pgsnjYCcR8UgzVy2qxDQS+EzetzV1Wacj6O8yuDyzNFmJuWVLNC
         1rjRGViN5iFpzNbn49sUh1QQmAVccna/a0LTpM0wCAMoupONHsLzXBv2tVxf0bhU+rd1
         15CWCpitZ+LzdlrUv0Oyl7hd88kSiFh7JD+ZDNxihV9PhZoXgtN8R/TkLl9vrhlKqXqF
         4Ocg==
X-Forwarded-Encrypted: i=1; AL+hErGC/ibVpyaEL7+SNgbIU79Ha6aAYmS53f6Os+Hsxu3vE19RJ0aSNhfQDwoUDVXAoZVLPaA+VSinQKpybmU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HfIMsOaSoYH6bEyiymgT9HlZtN3SnWbNtn03rBS7uB/QcJgkX
	y6H3WAP+xpRjKoH847KvvVloFA9s9zAxkH7SxNpyzEaX+S870xcDCv7yLTJbNtgobe8tU0rhmfP
	t6rWzEvOu7RiWN4eVf0boq5Gah8k56tMgqrxQFdv4InS8wnAiKyt95jIIXqa9PaylVpUvNu8p7a
	8Woz6Q0cJOTuHO5Co1EFpAhsDK/oHpMNkNoQNzQSc=
X-Gm-Gg: AYBFou3Z2J/mfMZK/J2NXyoJMKrf+B1wZMckN/RTD9nFmFnXVP/ivVbNhSNEAbJKoGo
	x69HmjrWk05o4VbEOvPXZSSGHT+i48WNWgTjQ2/xwLQBF/eGbZVPw5bQeIvQIjgi8nyNvHurpuE
	AZVAg0B4asMVIVBF7SdselF6DhduWGiP7cehmgXwPBAx91aiw5XNy0RxOjH4i0/leEDa5Qne9CJ
	MleTgt34wPjlGLbBmNVB5r8dSxXSby0
X-Received: by 2002:a05:6a00:8d6:b0:8b6:400d:7cc3 with SMTP id d2e1a72fcca58-8c87c67021bmr1122495b3a.27.1795135567600;
        Thu, 19 Nov 2026 16:46:07 -0800 (PST)
X-Received: by 2002:a05:6a00:8d6:b0:8b6:400d:7cc3 with SMTP id
 d2e1a72fcca58-8c87c67021bmr1122469b3a.27.1795135567119; Thu, 19 Nov 2026
 16:46:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117192411.247117-1-toddfreed@meta.com> <20261119162146.28229969@kernel.org>
In-Reply-To: <20261119162146.28229969@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Thu, 19 Nov 2026 16:45:55 -0800
X-Gm-Features: Aa3M54qP1YCQf7NpHxLxwgOH9sNuFK0oZ-H3E0wPLjIaO2Wa5zKJBx45I7vhaDw
Message-ID: <CADh2yMyEv46Ms1ne7rDWEJ6EFxQTe_OLnW4-TDCRSWusPoodVg@mail.gmail.com>
Subject: Re: [PATCH net v2 0/3] net: don't redirect decrypted skbs to ingress,
 psp time-wait validator
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>, Daniel Zahka <daniel.zahka@gmail.com>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
        Wei Wang <weiwan@google.com>, Jamal Hadi Salim <jhs@mojatatu.com>,
        Jiri Pirko <jiri@resnulli.us>, Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau <martin.lau@linux.dev>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>,
        Sabrina Dubroca <sd@queasysnail.net>,
        Boris Pismenny <borisp@nvidia.com>, bpf@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=Ia0Symqa c=1 sm=1 tr=0 ts=6aff9850 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=JnKecZnUtZousrUlYMGU:22
 a=uh9GPBYV2gxs7o8O5dIA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: pLk_7mOpMop-rbwQxB-I6ufddEbG6Fu7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAwMiBTYWx0ZWRfX8Up9l9kKBDlN
 MEHLZXMho9orBgXVdoOeVHZgcjjpIazpihSrkQz47EhyIauG2YoaQJ91TGoB5JaAqGY1ln/YELb
 kygzijVM1zT7tjT5QeUaxertI89AVsk=
X-Proofpoint-GUID: pLk_7mOpMop-rbwQxB-I6ufddEbG6Fu7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAwMiBTYWx0ZWRfX/N05nByUDnlK
 vCrSjQoV+7Rr4iPCRpuUU9n4Z8j+pq7ag4Oo12UXm9hely3IpPJ5cQJjZgKCd6mvi//k29s7DUk
 oD1dOCJXEo7b2PQrBTFNCPj7B1d+pQElMPbEmApvGWN1epfReiqZSJBjw3MFpl6cADUgkkfkKKq
 ql71dMV8XXeTCdN3PhZzloVgyAqF/hef10ePexx2qp1FZNQPWVpHAm1x94SvzND55aM5P8RxodN
 NQybmUvXSaqXvi05fBWI9MtUfgvaRFm3EUFHN/KDTUfWy5dk9pFXl+pUik6wqE1YCJLlpbTLaaK
 aQVYT5C6Gq9uUYXMlxtxtDHqKgUiR2ygHmYRIhMnT3PWZyexxrUnNoxCem4DO3A74JbsIH5E0gA
 KJU06h9XHtFV1L2ipfJxlgz0jNK0s3xPx/Sj6gMMR9ocdtKo7SIFYpneGXOiA7bRayz7R5J86YZ
 pR1JvnuFxFS692qAYDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01

> For future reference - there needs to be a path in net that hits the bug
> for something to be considered a net-worthy fix. Otherwise no Fixes tag
> and to net-next it goes.

Makes sense, I will keep this in mind.

-Todd
