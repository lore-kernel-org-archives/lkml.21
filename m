Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795528759;
	b=ysYX/0KzyxPWQqH/rsRKMUlxmDgRX6IbgqzHEBPx/quAsi/D9C1UNk9kamfX0L+kw/+v
	 SZDs2uPhwGv1OGq1edVsNGM/pCeKl5bMySBO02oveJveWrupACmxcsK6txhNHkqSRLhzl
	 r6pnvgx7cBN11d3DdYzAQibj/MgkdnHqeo9wDHnd5pUD7G6bkfsoX1nT2JLe6SeZMPK+b
	 /nd5kgKDDfyaGDP/eK6l7yp7aBRJh6vwjLCCmKB3j5hCZVW7bgjFVsTi26gw3GpcHjkPT
	 cu1413w0e8LzhKVB8Tz6BMeg8VRoIuOImCsnh5ag8IK+cNAgjGaaNi7wjojbGAXq6DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528759;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=A3B9SHbkg4CZWm8wkavxTHR67/yF+kGgAeL/quNdhj4=;
	b=yB3h1GHZ+X91GVc0yIhT+nJ2fOWlLrtFuejs7T0G7ZlkRgoBOZytDLcnhVVmWyID8r5x
	 so5BHzUWEVph9TGXcMWL44pN89WWzUgPR3MAad/k6pKPgrTGwOHK65kL4+FtLAB5s7sCF
	 W4hOC8n4PJaobN9xwAtamjcjUrB8Z2CfVPZJYWqCU5gWyt6+i7pjbnjdHX3x7fbAGeoU4
	 RzpYx+tMlnd1WewW5wHhn94/MaGxUq2+J2KVlyO6Y2H8xyL+7wPLB4OhdSYWSkhbYEjsI
	 QuZ1eoCDonHPkHSKRQNqPd28X6rWfqW7skv0eOB8yQm43/a+PaHsBwMYxjpIEoQit0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cjon4Ucj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IN7Q9iD+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E42F606A33A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E42F606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cjon4Ucj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IN7Q9iD+
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAubig1025311
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:59:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A3B9SHbkg4CZWm8wkavxTHR67/yF+kGgAeL/quNdhj4=; b=cjon4UcjWcOCiCM8
	gWnrwDsiwp8zzMGkWAJPa9keZO2UKCWvdPbBRjeXwrgILeg8A0E6yZL/f9eCqQJy
	O96ohgLQVhZoEIEGGSYendAY0kAs4E/AMMnW7bUQvgm6QHQwOBM5GYlpnMNBqIpb
	G0+KKhKO6HwZ9cJ6SstBm1mVACHgb7ITZaNm349eAUITvyDoOK2Vhts2i71NShzZ
	aTsFDdMyLx5KEmJUoQnOJeHpgXB5N7GQrcGeLfGns3+3ypy6i0l80fMK6zj/XH4v
	ZmAfEaXUVS7MnftLthxU7ZN2TGHLRlWLMZsQMYPU16dT6qFU53GTsRU5/hGoAumG
	Y+fjhQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yyt343r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:59:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94961ed97d6so805628085a.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795528757; x=1796133557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A3B9SHbkg4CZWm8wkavxTHR67/yF+kGgAeL/quNdhj4=;
        b=IN7Q9iD+O4F/PJc2it92D9/IjlQdp6EwM5TEPIVGAQp/v8AEcn9kZyUR/VAhDLneHt
         pdzxCFGP/NAzkGdU1isqrDhHoOxMk2h8qpS78rlgoYO8IUehw5J2N+iaPuMU3eNwEWzI
         a8o/dWwAUN6BpOZOyDZ9PvKU4PUHMoWWAy2GSsX7k1bH3Atyi61hOxt7zbzqvV1hPNy+
         zOeTFRl9M/nygxps3bdprTPVsKW1OPP619EBYe/xe+2nwlmlibFlTVrVKjCqImiYtRxa
         1nG+ztXgG/QZ660Qq3uMBEz8998p76BroN1nAbKGxFgF7/D0rdWigxIMQieNNoE9l535
         ii6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795528757; x=1796133557;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A3B9SHbkg4CZWm8wkavxTHR67/yF+kGgAeL/quNdhj4=;
        b=VtpjsYD8b7DIskNVHWCW3BW6a897u2bLIcd88IDLN/TmjqKdthiCgLQc2rfdIgoey4
         Yt+6vl26ave+eQJY6GPf/9sfXph0PDdH8S3AsziooeZQZEVe31xPl3JbM9l19dHfbxoq
         E5fvN0fyLQ9h4n9hYhtQxn4SeyC7ReNa3jFZrNAWLfvAw3ighRQjVUQ9Qth5LEl2aWKl
         Kw7mqu02VlGyCJVbyL+1I5lv1iutJ0kMi+PZmKc8ALPG3+g8X8ZNdo+yu57SFH0OUVhS
         H/M/CauVpEgqDqhUJ51auHFJszR+caXltx7szNqsKGe4VKkUQ45xWu6Z6CXmuZU7J+xq
         XkcA==
X-Forwarded-Encrypted: i=1; AL+hErFjZrzSPtSuEzpzkIjNzvV5EWJs1V8kRsGFZaNp9Azy0vUyzZQFxsSAvEZGcUFRz0XbsboBNdIwMNLNO9Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NKMrOQHPMklfn+V+qZ6E2kdxMkS4K7vRJ8UY5xdHyuOC6+TrJ
	7ydmfnOTjsvDNgXP9cmE1FPP+H0WXlGd8LUKpgy9/qWcAjE/oxkgej1gsRDdGhN/vIfYYAwSgQf
	rI1Ho33E/AA3mRXIzq3edLqduEsQ3v2s3d/y6ELNZmoOkrhtUyMQkMudF8ReSWeAbnQ0=
X-Gm-Gg: AZFdTZeMC78E/aABD2vBy1OeZ7/rNDpYafFvkNJYU8VTE0T8KOOGOSKbYVFUgXDRXjn
	XX0//QIEsCg8DKSm9SjD+IOtNufTWZq8hqYqTwS/Q9mQouvjTI1gu6uxf+ZRLgT4adr28l24/Pc
	m1X7C65zAx+x/7jYlhijL9rklbdUyHlxbcDrPgbqgNU6xLWspEh//hWUZep1pABZqrvhhrjlxos
	SpkhrSDdytgVTjAfrBTej5yynNRDi5QkKWYas9gDCnhsZ1tVrXrPwg5B0n1JVS7TLezMIGu+bTm
	tBlREWlg+kK00n0vNE2hWq3PFP5FvTzAr3ckMoyeuqy7AnnX10/tuZrNqUfkDZr+tW6nI1S2MJz
	rs4Ugvazb7fvZXMgXi5IjK/NyNx/PaM5vJ65dxkhq2gM37ObQlSf5pj8RBqdL35ZVtkS60RfuSA
	hVkOZVtZ7lF9FRTI44TLkIKuRBU9LupZdC1hvtTVPnK8P93dyMZSL1xLn9CEG82A==
X-Received: by 2002:a05:620a:1b82:b0:946:1dc:a276 with SMTP id af79cd13be357-949b35ac8d5mr2739757785a.18.1795528757543;
        Tue, 24 Nov 2026 05:59:17 -0800 (PST)
X-Received: by 2002:a05:620a:1b82:b0:946:1dc:a276 with SMTP id af79cd13be357-949b35ac8d5mr2739752885a.18.1795528757012;
        Tue, 24 Nov 2026 05:59:17 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm28945865f8f.48.2026.11.24.05.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:59:16 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Kent Gibson <warthog618@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-wireless@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2 v8] gpiolib: finish the legacy cleanup
Date: Tue, 24 Nov 2026 14:59:13 +0100
Message-ID: <179552875131.26219.14927804757047791549.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123085723.156933-1-arnd@kernel.org>
References: <20261123085723.156933-1-arnd@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NCBTYWx0ZWRfXzPZnOC/Ey098
 b7Up76+DhSPMTszHpaiYrNDTu6BS+cZoMzqrjSJhpT7UhT0nriFR+wZJw3sOcEP4cUE67QV3pG2
 nPqc720XXtFe3OSWJvO8WG35kyFuqL4=
X-Proofpoint-GUID: qZb_15F9WMZNS2dE9cl6azrA-nNXp2R_
X-Proofpoint-ORIG-GUID: qZb_15F9WMZNS2dE9cl6azrA-nNXp2R_
X-Authority-Analysis: v=2.4 cv=W9OtxhWk c=1 sm=1 tr=0 ts=6b059836 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5VOqrEiZFYvkFkybF-sA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NCBTYWx0ZWRfX0n2MqbbzlSgS
 SqUaq5iwu1HTRUF5Qj8NJlelw40vymFsNN9cdxPxp5fWNYA4RVRS2i2xaXgmcuX4B6pzDcT12zl
 Hdasc/DhTAW5t+bSivvz1kyUH57mznibfeLLFQBJoFxH4m7Duw0MtlQTpz4czHTrgey0pHqx9TN
 u3/I+DVSwjrvg6vbN+6ZPDWhBgvs7Qg/SamHYiM7qzLYSF5TF2YzowKUhgLg/8BTi5yCuaPNNgA
 xbhGEHEEqbL0zXjwbYP982LkfzrdfjZAKc96lQloU1sLGgEwPk5aTJbkZcH/0JDkgcfgKfBeOzM
 m2qfCJF72SGH8PO3IRJ6/C19NmqXgbSoh1sUp8KODUljmC+SgjjigetQAbqKBkApOaqqHYT5LKo
 Rhhks+lz3CV3v/42NpZjEU2B8OQYqu9/ht3OirAgVtayuYs8m3Fr/1CS5K2/PczQp2phVtpczWi
 qsXReV4lSbZ6c3I8rVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240054


On Mon, 23 Nov 2026 09:57:21 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> These two patches are left from my cleanup series, finishing off the
> work to turn off CONFIG_GPIOLIB_LEGACY by default, and removing the
> include/linux/gpio.h header.
> 
> This was planned for 7.3 originally[1], but kept conflicting with
> ongoing cleanups for the broken rsk7203 board. I've skipped the
> oneline rsk change now, which will be fixed properly by Dmitry's
> patch [2].
> 
> [...]

Applied, thanks!

[1/2] gpiolib: turn off legacy interface by default
      https://git.kernel.org/brgl/c/b52fb554b36ba37f86a591d0d27dc45fc5628920

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
