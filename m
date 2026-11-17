Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794954607;
	b=T/erNrCCA9fsNflImhDsJeffcXlDYNyPOUvDubDGAXlG1oxI8TghbVAI6tJrpKRZCqOY
	 VNWk/OFtcuYk/W7J6Rh46oVcZGbficS99bnkzo/44HiOaCWJ/kAl6J8c4nf6WPnWP68Td
	 s9D0qd3HVrNYffpxaIbilm389L3nIjsBp8JoPdO0YJQxvYSugc6vOL7LNJE8mFqCKjXIb
	 YO2ewr9PHCtIkQH2MkNPWqR9lfzNe4mMMG8YptwC0NJ2IiURFxCkiFwfIdIbT3yIku5sO
	 bmCVAN9b66/jasPTV1RA7djQWb/Kvr4k+G858wePXD54dKupcnTFSUTHyETpoQBlqwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954607;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=KyDWO0/aXgj9Rt69ltOENPsFV1jksEPL0QStiZFNoLw=;
	b=Gfk8+zJ3bgbMYEp0i3XiKmkk2CIzD/f7uWQLweELK3qBHiEMBC3Tn68BtIukdL+ZPEDr
	 kg7Mpnk2TINX5tw7ZsNhoY2t3qTRxx36/oeGWtj6WM5yqpHFkDn0+v5VTo1vghTTX6e4w
	 JeqaUhYkcNO6hyzFWgHk/wV5dui9UAtJaHZA1y00qMAGXznHXOkKPiD1vUHz1E/oPhC3k
	 9OhRwONH34Acm/hI+yvj0lmXd4dKrHQpk19Px92bWx+P4sRRObjxW9BFRzUE4kEghjNSa
	 EzS5DDL+LWvnGT72lfkvSgGNAnFQYjC+oLsYnSQCot5R3ATLT4erHFYj0f6wmXqx14Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=bOfEnIBU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72BC606A330
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C72BC606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=bOfEnIBU
Received: from pps.filterd (m0528004.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHM1u9b2069569
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:30:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=KyDWO0/aXgj
	9Rt69ltOENPsFV1jksEPL0QStiZFNoLw=; b=bOfEnIBUXJ7bXz2NrfMubG5jwGR
	6jN9LTRddaVvweRF6J6poXO1rNj6AwMta2gKHOV3hwyI88N0Ig55OW1IcebZwrtv
	mc6yE82eh5XbzOd8B2PGTR28CGWx1oj9Ay/mzcEzSVSMkGfaG4LYgl+dpJWjuvvD
	V1ZmON0tX1Osf2Lm0wPDir0fCLzcZuRoYUsO1Iy4vMbA9POOA+6JH40mOWi3TCsm
	dRTW56gk4loflTT37NNmVrKcvR2hIuxQKe3hfu01wDEigH9osq5WP3LFJMTv0UCJ
	vUJBimgVSMDyiDFY/PodREJjfSxqnIOleJ/qCq82tGOD/cfLXNpVqmZmpEg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j0w0bt347-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:30:05 -0800 (PST)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b3b0ebd98cso209899a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:30:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794954604; cv=none;
        d=google.com; s=arc-20260327;
        b=Ja4zmUjNyynVN1jogOQYlUM/s1lbL8ijQuKfdt5QmPbwQkoIy9Mulj4TltRa92LpE8
         DUU7It6LdAnu6+j9EDCmUr0kMHb7gsOJ0iumyTAxn1PAcH2gw1FFQcIvx9Avc7AAOL+D
         HrAr6l/AMpnsGVmWYziOJna7nR+AQms4U71449Vy1TOpxaQZdk2SytACiIMgbeOiYFNW
         /x4Ol1sKS7uWzUDZ0tzr8hJwo+TQzuLAYCSayTmquxYOGcFmzj2MARaSuPnz5TqicOli
         4OUUI6x8npwTmdiyGaPWXAKyKbjHE4Rns3I/KzwEpBq4qOUI5AaOmXZEttKjw63L4kpg
         I8qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=KyDWO0/aXgj9Rt69ltOENPsFV1jksEPL0QStiZFNoLw=;
        fh=i2CldSJt8LTFSRzO/Q6Q5wA47oXVk/kP/wkccCZWfT0=;
        b=G401DDt8B7hkCT+pI1jLSmu829IQ52RxMsUQGMomzZpFt/jzKM0J3ZRSttjVjUlFxs
         BsUz+ad/Jzj2umWY29zRn3cjUyx7OAr0J5AcOwmVQdT4HHzgUIvtgTVcHFIA7Xeeu7Y7
         vg/8RYEIblQr+fKZSkIM5agzZ7vw6n4zFX98LKxPD8qMoUVpvYWFH6CYDphcKxonLAmi
         KSyPhpYVIXHE+1s+RdqGFFsiYqC7D4P82LMeeRIcUwNc0TFUEBogDWWIzyJiDQYhxa2N
         PxP30S9kLZ7U23UvZzhlEEMxjHmWOdlwPmhpSmnQw+ujB0EP5dfljSIxZxIC+2D4FQIq
         TmzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794954604; x=1795559404;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KyDWO0/aXgj9Rt69ltOENPsFV1jksEPL0QStiZFNoLw=;
        b=znrwL19QyAHIyxnJpcgQdW/YCGx0NHCBOeA90rNNwNt1M1Rg63hfigF0TJJp8tWeun
         WYYsZGRvbERWsT9s3AFfCRvNFj95Wwo2bD6DuTuVr6Vk0X6ZtrJXkFMVIZPnLpAuW6gm
         zxlECAfVpMjzeq+NxoOQa6UJliDBIgQN/sdA/sTSDn0DNfD/9QKchw1kUeFjtxVAFhSv
         0EZ5/RrIA+wmwryg+qZ0YDY/Qcv+SbA2xrDHzPDSd4qzK51OCj60PEKD1O5Nt4DHG/u6
         VfqaOv3ja2T8dqt6kPUdLgrf4D3/Am11V+WAKiQfvyd0d1v4dPqFQkEML+o33oi2g5du
         b9Hw==
X-Forwarded-Encrypted: i=1; AL+hErE49bQm5qovuLPIdbvyM0stvk9X6r6eIDiHF+zrFcHhJMh5xwrsTwclwhMGlzgXiGnVscCi7AvB+uDHsqg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HZ6J6+IWWWp3zBCeVrsBzcD2kpQGxoVrl7XLvEXFj9mhD5263
	GgunaN7/Ym6vLjISFk9+V4bP7Z9/Hovi1bX+d38EVMxySPwCYSDsZMrj/CAj7aBWKt3jnnf5/AA
	n+UccvSz6bh0NoQgYlTUuZ2L8LlN5BvlYH1S7aW0SGkzPWsFpxc9/h8MUHBmdU0nvDjdPLD+V/y
	q0RJSX8tV/vXyz5rNEOnCxXxA1gcjhAMeK7EsooZc=
X-Gm-Gg: AZFdTZdIesqC5utHZJNlYv48OEEKmFGszD0jELTBbi6Hk5s2n9qxuhvJ4PGLpB4F/NU
	B5izMWzBdw0g/X5PXpu/xPpXhwhzsnU94q0yxcWGTW0lspO1vS0os3Pbw3iJV69FcKVyl7Do+Ne
	xGwt/vGRh3ncxHPSdvF+FPXkIgwt07NN9sv09FOCAOkzVapn7iwX8zlEsOZ5Dcy2hqm9mpocD3A
	mYZk9LqtC8YYpw6FxEkNOVpfQjFcVGZfcGtKb5Nalz0fkiw7z0=
X-Received: by 2002:a17:90b:2fcc:b0:3b0:b64e:1e34 with SMTP id 98e67ed59e1d1-3b3d07d93eemr814955a91.51.1794954604514;
        Tue, 17 Nov 2026 14:30:04 -0800 (PST)
X-Received: by 2002:a17:90b:2fcc:b0:3b0:b64e:1e34 with SMTP id
 98e67ed59e1d1-3b3d07d93eemr814926a91.51.1794954604046; Tue, 17 Nov 2026
 14:30:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-8-toddfreed@meta.com> <179471270091.2199510.4320994626979041884@kernel.org>
In-Reply-To: <179471270091.2199510.4320994626979041884@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Tue, 17 Nov 2026 14:29:53 -0800
X-Gm-Features: AclHuK8ozq1AL-AsYPXNzCLCrFAtXWz49sr600reWw55cTUb-tnGMH92_LvEb0k
Message-ID: <CADh2yMwoR3ZJUwCSbUuY85qPN=c-TKqb6BZeB87q=B24tTTaRw@mail.gmail.com>
Subject: Re: [PATCH net-next v1 07/15] bpf: don't redirect decrypted skbs from
 egress to ingress
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
        bjorn@kernel.org, bpf@vger.kernel.org, daniel@iogearbox.net,
        daniel.zahka@gmail.com, donald.hunter@gmail.com, edumazet@kernel.org,
        kuba@kernel.org, jhs@mojatatu.com, jiri@resnulli.us,
        john.fastabend@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, martin.lau@linux.dev, pabeni@redhat.com,
        saeedm@nvidia.com, horms@kernel.org, tariqt@nvidia.com,
        weiwan@google.com, willemdebruijn.kernel@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: x1IHohHb7gOziL5bQ2TF0A-5i8JRZ0Fy
X-Proofpoint-ORIG-GUID: x1IHohHb7gOziL5bQ2TF0A-5i8JRZ0Fy
X-Authority-Analysis: v=2.4 cv=NM1AaE6g c=1 sm=1 tr=0 ts=6afcd56d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=GbPsI2Ihf5RTnMjR_gZv:22
 a=DLdrzcY1xBZ9M_96H7gA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA4OSBTYWx0ZWRfXyPbgZo5Z+nD/
 SpBh7PDPBYA/rd7CVJiruCeEf6dXYpmeuQB7TDKOPkJMlLQxdwTQygwaIsu+438gK51QtpUiRE1
 xfmVu7W4DO611NaYp2ywhA9/VZwa07Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA4OSBTYWx0ZWRfX9/lHLbsdV80+
 2Y6ThfPGpWzbqxFFEzPB2ooENLYpa0JEgja6CSVDulhfXdjiqV6oKk6FGzxY+64LvpygjFbN3IL
 rpEp4+PatlHz3Z8JZF2JuNPtB24IJcCPKP5LSxyl0+kWwnVEqEjMlgnV32JC3IqzX0YHXCl/of6
 vOs0+6Ci0uME0oql+mckz4ztwbLzubTNcuzFDkG+jIaroc6SZvW28Y8XG7IjU8FTdUC1ECkFx1s
 8d/rsS92cj5s7+/dDCG24r4GxywxFyn3nTGdGCZo9Cau1r29+1bd0eRvGNj9ZYLpYEsNES5jo3+
 QcFWHLqDLLYh6gU2yKu8WpucnsH6cRUM8WaQnDgJ8aOLG+fW1Xu54x4wvb59FLt9VbkrQ+at0ps
 PClMWTsQVkvO+xjiZxB0pw8n9PiqG5pLFiCdn7V3ej37d3p5xO6DnUyzssLl5RLrN7yPo5v/eor
 BTJjKWseyf9XXXHSW9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01

> [Severity: Medium]
> Is skb_at_tc_ingress() a reliable direction signal for every caller of
> __bpf_redirect()?
>
> tcf_mirred_act() only checks this inside a tc hook, where tc_at_ingress
> is always current. But __bpf_redirect() is also reached from LWT xmit
> programs. lwt_xmit_func_proto() gives those programs bpf_redirect() and
> bpf_clone_redirect(), and BPF_F_INGRESS is an accepted flag:
>
> ...
>
> Without a tc ingress hook on the host-side veth, the same packet and the
> same program get -EINVAL, and the packet is dropped.

Real finding.

This patch was re-posted as a Fix to net as patch2 in the series
"net: don't redirect decrypted skbs to ingress, psp time-wait validator".
This path is addressed there by calling tcx_set_ingress(false) in bpf_xmit().

-Todd
