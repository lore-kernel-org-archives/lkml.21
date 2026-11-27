Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776486;
	b=1HXaiaO4oPNRkLqya7eUD6fpsDzIMhxTKp+RQJndkJpwMxgpAkAGYzi7qbPnvg/WNSsQ
	 Gc+rK8ZB4APVe8vo+zjFmzyH2y0Z5r43sVBn98/zzRDKescTIX55V09Knw7h8tBIziepV
	 YKE+Ua+MIOTgKOq5wPcL86FdG0zSiH6Oh6tlagSkO3zQFqetWbPG0I2ZEzAsXm7+hIT7e
	 wSjifp8xT/KOhxPnmo93eEiaWI1AKt6GaEYSxL1/4eHeR21HhBuP2h0Q0AXXMefSLqTtZ
	 tt9s/muzpzxTcDbTqYAUKqdG45yNE4v0ZYO1yrW/kGQOGf+A2imQujIih9ByEBRMVrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776486;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JyLQG9rBTqQArwS4viwQVVgmtdrQukXBgj35Nu+6H5o=;
	b=AZ9wi6fGoQYHnebyBYfdRclq/lPlox/Bw061U6gGck44/5pqU2a8cIJPJSNdvBCTYyvv
	 VBbtgAhzRyVj2msXSxlbWT5+uqQpSTglutwjKp6mhv6oy4Plq8AYv+I+gMrcUb6+gMydU
	 OyOOxY+eyEyw+fD531A35cQ5Ous9CWZw3KDwM2Ff1c1ubfzBMAEqBN45a5OxRfjdxvC5o
	 //6Ag46/mSEzyyHn5humFl6mS2zOyoYDJnc1/zWp538DCtYR+EEoIdPXFK4rEn2lR+1E5
	 o1TMX1r4G+FVAEKWiotlAX80fUTgVjOJj1EtyrCiLk/mDtmewWLbQFxxMuQkQV1ouhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M5tKHBIJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="N/usZCS9";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A750E606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A750E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M5tKHBIJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N/usZCS9
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GpfI560431
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:48:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=JyLQG9rBTqQArwS4viwQVVgmtdrQukXBgj35Nu+6H5o=; b=M5
	tKHBIJ8nWRAJzDPhmHVzYuCtdlzvZw9LMVfCWXJuH+7nLvkau74NMoD5KpiRpm7O
	+C9nRYoKdBzK/T12Jp2hpAqdo+ErX66u+Z+IdG1xZlSdayg98QL3mbNWk49s+ccw
	c8At/XSk5tVvTE07NIplu17lo1GPOAcVzoxyPVNn72smrzOSJtoJxU50r++tvMw1
	uP5ILmYa4uBltmFXezN5FroarsLj4HIpp3mI03Qsq0ZUyEKI47oIKoOWwbHd0r7e
	/Zif9Hfy9wHZ/6xv1XV5WhI7H+ScbE91GpsuuU+BfS9lo/kldJyJkwX9gOw3llwN
	xnCW2gcYWocS9s1G77UA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqkk9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:48:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94960bd17b5so1241760685a.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795776484; x=1796381284; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JyLQG9rBTqQArwS4viwQVVgmtdrQukXBgj35Nu+6H5o=;
        b=N/usZCS9Vpri6IoBF1KOBNxCtex6GgcP4pZTBmDhiTLDZ352J6QjJzAbWLBUj/0byB
         PvwpDRR7WIj4urEQ0yHaSTofA4AHGMLu54utq9WUwYpMZBG13NPrG0MwnhyQ05YsoFkQ
         1QCt/UyDpBrYSoEPEr1sN9ELgQDyx1LJeUclkwxGI3VkmcVXlLMTkpGhLTeT07OJixcl
         +1ipZp+zhQW77AlyrX+H1hbvVpBbTw71uOcVOq5gALeKpJq93SI2svHKduP3+inWqSHy
         AocNwHqngTASIZrZGVOcZzIwjb+xxAniK+cweqOUrLTAjuJXgwhTz+rPK+VeFxhp5qC4
         3ZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776484; x=1796381284;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JyLQG9rBTqQArwS4viwQVVgmtdrQukXBgj35Nu+6H5o=;
        b=WnFQRchZud28zXmTSJnfHEgHeDyr1Em27AfU0ZJJKEnjMwdv47Ci0be1cOAXFDv/BF
         svypkdCrs8SLRsAUYWT1ipqbzYd1jZMj3FkQCwm56drEZ4P/F5ctrA1Sjehz2sK4GEG7
         8vuJSvt65o/pG9a0h6ngX1ZW4spdbEpCv/tF2M2b7mgf07kU2687hG4D6GYC8I4ZEwlR
         aVPw9qPA8s/5/DNXa8XnIWICqR7z8e58zb3Y806yhzFaF9HothUXK6Ae7k4v8pJuZhqH
         YppnHA//fSIiZjAeLyi600ttp0gbRxHv4vuFbVRDjTyojUeW1D3ALd+oUF5eu3OuHR9P
         JiYg==
X-Gm-Message-State: APuU4Z9DNxbnyLStQH3lJgijOBiiPqAw9eZJhni6G9BgUGCyeGu8M78K
	M+YV12WJriQHi2/n4BwQAywLVUXDq0bGJtFsJzuIbSmCblv+xYhnb+KPABQI2G7RM2a/yCuqZzi
	8dBEALWEEhUGTYgsHZmkWCu6y/5xCGWUSORIh1xd6Nzs0O1nkZhTdLD+sbS1Jt6VgMKM=
X-Gm-Gg: AZFdTZfo3kSzrmpJPd0+XW+F63ar31qhtBpRW1iAbzOZ1y0dUmzoxYacDoPFZFERRb6
	6ln8FFdy3SK1q2st7C7rRoP4H+gmtDx7yRvmSMm/iGYy+pbJE9MQUuKYw4H/oya58SY7J3dulBJ
	30Nh278D/5ubni88fNecK4LdxPcLIlJA6ZYXIwlnOQIr4ZLK15hlEnIITLQ7xtZyhHqnkwNBKWT
	fGKPjuD337rkrTRGEMECYLPnXUlU7/SDFYKoElGlPy2KjeLAq9InPwyckPsrO7VWjMI7Jlayg40
	DDNkrVn0pF2nUj+ZulJxkeDuC9Xn89uHazVeSwl+2kijnhuYOMrAw8rFEyXGjcUFMf2gFa0eP4Y
	YUD/cJ9yT4cYEg6Tgu07VPO8uD7dO69Hs3ScoGGKz2n44x3ZfDZKUBqDofSjSvMGJZ3ndGAXh+2
	aSUHmqAYuM0eE6KUmT1qpueTsPIFeuqgt/yYGxTtJhjrxiJ0QT0b216oJwn2mL74WLkRVhMIJSl
	r1X
X-Received: by 2002:a05:620a:4554:b0:93f:3565:813 with SMTP id af79cd13be357-949ba80f8a1mr3805080285a.9.1795776483829;
        Fri, 27 Nov 2026 02:48:03 -0800 (PST)
X-Received: by 2002:a05:620a:4554:b0:93f:3565:813 with SMTP id af79cd13be357-949ba80f8a1mr3805077685a.9.1795776483317;
        Fri, 27 Nov 2026 02:48:03 -0800 (PST)
Received: from rayden (h-79-136-84-34.A175.priv.bahnhof.se. [79.136.84.34])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8a4sm10777328a12.21.2026.11.27.02.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:48:01 -0800 (PST)
Date: Fri, 27 Nov 2026 11:47:59 +0100
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
To: arm@kernel.org, soc@kernel.org
Cc: linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] QTEE fix for v7.4
Message-ID: <20261127104759.GA2747365@rayden>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Proofpoint-GUID: 6X4retaYF-nYI5qiaDAe-NJo5MfpZrzv
X-Proofpoint-ORIG-GUID: 6X4retaYF-nYI5qiaDAe-NJo5MfpZrzv
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b095fe4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dMv3lA6PLLkT9/uWe4YCGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=KyRjHmHKXXPnJxnbqygA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0MiBTYWx0ZWRfX4qsOoXauUPgD
 yLcXzBmMJnK13HGf5MHw3aakkt+tS5Y5bjhklWgftDHyHj6AG9DPtebRmH6XYAzZ5SlbpnKwxyL
 R4RHZFzxg1bxGMdf58dDhun8SYAgWV8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0MiBTYWx0ZWRfX2OkxdyWPBYZh
 wFIGtI3mRkl8aoVNFNHuxBh73zlyA/EZEt2kkxo+R9HVFDnMQMim81/JkeZodi96znFI7RMsa29
 EpOak0hdAn930McJQxunVXwHg8YLslIhVYhwPIjao4bU9qtrJVzN9Aa9yWuMmFtlI4mYXvUFbLf
 thQNq+BdaqmStbCIgp0/EI8idLbr23MU5HOsB4PqKz7s9kLWsRsbphe6KfgjxkRLuzCroKPQc7Y
 7LhUmWVebG3IpZI08TTCf6RnDc7inPIts3UShahhUCVXYKSiHLxtgnZg1kfqgPdZ959/jc49o/C
 cHUYe1Q7JZltMJVndg8aB3tguJPnI0s8fIZzpzFscNf2xDWMFV9tqCoAAK8FxO72wn39E3ZBfzX
 293yuQxL4gSzjud/4SS0yTDjB3hHZePkWLjQMoB+GUG6KshAcsksqKqGEZN3EgNfotr5Kqgu8re
 9/uqffJ8bLLnIzhFqpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270042

Hello soc maintainers,

Please pull this small fix for the QTEE driver in the TEE subsystem.

Thanks,
Jens

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/qtee-fix-for-v7.4

for you to fetch changes up to 5f1bad1c10cbd008a6b2042cc4cb486f6b2e29e2:

  tee: qcomtee: user: check the parameter count from the supplicant (2026-11-05 16:29:09 +0100)

----------------------------------------------------------------
qtee: Check the parameter count from the supplicant

----------------------------------------------------------------
HyeongJun An (1):
      tee: qcomtee: user: check the parameter count from the supplicant

 drivers/tee/qcomtee/user_obj.c | 4 ++++
 1 file changed, 4 insertions(+)
