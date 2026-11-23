Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445683;
	b=yAnnwg3MoY26wLsRw4COT2RyYZAdIfhQKxn3/41lM1PNce5lHwxHfY7opJJtevJRxU7V
	 DTIlPHsiPijNXsze8gFL1IoZA/nBVUweMFE0DwtYN5P9RAQzmXqBcAYTMwFgE3a644ZIU
	 eINam2DEJzSwOoAPVoyF6197QnqW/yJdXqFFqoMZFHTjd34NGJhJ87H1Jj5954G91eL/g
	 lBRB4MKQ2uRGZNV/Fm9NNRMM5G+4GQbqjPHqSO9t0qV94a2FWLCEMuK+sFI2m9nQdlyQ0
	 pVGmqrKhI4l3DFxL3I5W+divooES3i5p9cK13w2bJutr6e/8gWXqp8U6b/D5Sv8BR8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445683;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cjdhAiDDNjn2+9CEOyy6QSd/w/KllDQxmuyoGixQI3M=;
	b=loYAhln+3Gf4ysZlFeFC+/RAXTjNvnqTtNs6EKYkrbKabibFMztpCiyPDB5gh3QKil+D
	 Gh7m/oqm0/vgm/d3wMLZiPl2F+5S7f4SY37ckWAjYu4PEul7w+22XfDmTfk6QF3xEebwi
	 +9yX7w3CYr20lJJoBRZjYC/uG7cTtg+cz2+NSVrv06thxdlG4RxV6nHQ4Gl0V1ywPcauI
	 lQKlGxKfjOzS/Y0v0ohC8rR3Q20mhGua1rpFz7RJU+xIL95FfEtKbReyxuxYJCNRAnx2F
	 KrYXo9CeiBMuVKghqI7NSOXWTtxV6K+OcopA5mRizUPZYnganz19zDk8cExpblHMo7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MFZ2YcHi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Rg1j/yKT";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F034606A685
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:54:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F034606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MFZ2YcHi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rg1j/yKT
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKq7K2369022
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cjdhAiDDNjn2+9CEOyy6QSd/w/KllDQxmuyoGixQI3M=; b=MFZ2YcHiETwRhg9/
	DIdZ4DGjkEzUgOGtUu450VTuKRKTfK9gvPPVXbcnks5Ibu9HV8WSHmOi887T1ZhZ
	7uKeSUY5zbxBymI2R2FHR2fpV7Cfd5GQHpgtoVm+o75PYmfAJjZZ7ouWmko77mu9
	UIgMVjfJS85VPNmEBhVjryo2tBfG8LrzNmyZV83s1E8kgDpIEIFMQwL9U08q8d7h
	fWgES4y1lnUEEbjNyXfLh4Yp+4vv0E0Zez0eJaxcyeYWchblMHYoHobsT3YydFWr
	1VTOap3EKB60jYHBv06AZBBpGQZfU6EUO2JtluqXoGnatsKWOb6Dj07T3AdLPgc2
	kn4ahg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1p9vcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:54:41 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c97957d83bso120440e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795445681; x=1796050481; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cjdhAiDDNjn2+9CEOyy6QSd/w/KllDQxmuyoGixQI3M=;
        b=Rg1j/yKTZXfqBU4QGKaYLm5S5bm00zn8hXdvt9m9wGSelkpTeu+/uSjt8IBo86OjOb
         YRvtENPDbueaHVFbXueeKo2Q3SEvQTT1VnQFy3WZ6/FwDztJsStR3SY42CDMaa3nohJN
         tYYgA/AHuDX69sJPmtsGBaW/KVObBgSIUSppC3KbfDKtAw5uIlvwv7tD1jWhB662McBA
         5Hk3gQQRR2Ui3giXYbgndQM5qbBJBKTPIgvWRUvEcFD9Wo/aRX4JsFEKhqeUNt7gz+Sn
         0T4wxbSBU3lP+Mecon+F8EeQ3OsWFwsP3b2JT++MVgDiS1fezxQPp3598alRDNzeDJeY
         w47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445681; x=1796050481;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cjdhAiDDNjn2+9CEOyy6QSd/w/KllDQxmuyoGixQI3M=;
        b=y+/mK8YCT3/ax2Zz+62cc5SQgKCxuC75Dzoo9Xn1L4dNmCim49prkZsoXiWyjFdv3E
         I7RBUGy+C7qrERzSlocDNBbuZXGMtgv5esalTAl32znWtl3nXx9ZwWGjFakNUqxWyKcU
         OtAJFK8yAWEQHrUQXHGX3Gpr/aQETllxbgaO4oUS2NzQmFqhn2AHhPz/ys5tV/tpiXie
         dlVldwqvUGTreujl81RQmPCyXOWvCrtcUvvgfqpnS1kgWIeLj+ddbs/6tjO/Puqk27g1
         commm455a/F8lssDKoFCPWqxUWb6AJVSV1d/XBqBznO3qqQbZH1HnzRg+pPnc9fNwJ1i
         Zj4g==
X-Forwarded-Encrypted: i=1; AL+hErH4OtyhRqfEoXSuHJzWhjW9y22gNI6kzLFNDFN2QIuAUazEo3xAfqj2ArltVibdugXId5XL9IOTElWb56M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JhKhzrJjIrqEKWKw/00awUR9GNQyhfUWFHPxJyzpWnIxSEBYB
	cJnq4xc0c70aFM3aQ0MfK+r36TBpALVmlbqH6Sw8TIXhXyQMlnP9YLlzUDblK9X33iCMLpBKH20
	N1PY7F8L+BgpSj/s4NWMPro5uKV9ENJoNByPT8/rwfP2US9Mk+xa5rt8xf6kUGEQebik=
X-Gm-Gg: AZFdTZcgY/nlpiNucWEzPruopn4iDFcjJpNQNcibJUv5OUylgE287Ztfo0WyIKz6RIr
	8YzaZLXOGgJhtlj9ilK/uHLZgBe25waLEc39DvylKH9estKEbYNn/GdrKgLhn9VO/len5WTAax4
	NGAU+m3e2EtmWPsn411nkilbdATGJ6vufvQ1eKg8F1JU8LGLPVap6MzGZLXn94toSAw+bXY6BLr
	2ACOUQzHSVTXnEjiNaNUmfbzO1GxtqwCaJlggXnKbqDZ2v5J7PRDP2+A+tIT1+RwKqwF3OHltEO
	Ngab+QFiAySDCeRIjJk1t4MUQNfMwot3Bnt9wIMUe+vcX21m6w3Je1Eh3PTMSyYTB6eFX2seosQ
	y50sVHPP6oxfFRhrrhZsjfhQI3aySJGllCaiXjBekNJE8uhqI4vbLau6e6pHCGqfC7gLi8Lo=
X-Received: by 2002:ac5:cd3b:0:b0:5ec:e2a2:b70e with SMTP id 71dfb90a1353d-5ee8af4a71fmr5979634e0c.4.1795445680825;
        Mon, 23 Nov 2026 06:54:40 -0800 (PST)
X-Received: by 2002:ac5:cd3b:0:b0:5ec:e2a2:b70e with SMTP id 71dfb90a1353d-5ee8af4a71fmr5979593e0c.4.1795445680363;
        Mon, 23 Nov 2026 06:54:40 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea6e29sm413697266b.43.2026.11.23.06.54.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:54:39 -0800 (PST)
Message-ID: <52bacac3-557e-4b2f-83eb-3c82fdc2ae9f@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 15:54:37 +0100
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
Subject: Re: [PATCH] drm/msm: Use div64_u64() for the retired-submit GPU clock
To: emcp@enser.io, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261122-b4-drm-msm-retire-div64-v1-1-94d6981799d0@enser.io>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261122-b4-drm-msm-retire-div64-v1-1-94d6981799d0@enser.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1OSBTYWx0ZWRfXysHCj0yA7xS1
 HCiw9zLZTzTwQQ0iz125NWjfb9YxOAtjJtSv7BMVOV0O80URD8p6ol2u+fNsc4nyPaW/3z4WI2m
 sCn4QGPcBT7l3TG35N1u84aRR3Oi2jFdaCXKQL/NbAdVQkB8unGyp+rNOkmDDS8E0qMvBAI32nR
 stPHjlcnixGkGu4SPwm6HfX3mMVarMG+bMbcV8AFGcEzkRuQcHosyQLZejhGjEdlXOzTXFhz+Ze
 ZSXgw/l71yU1yzgvWYy4kMWPfKszpfgCXC+LQ3PCam5ykBTTkrzJraA/eBbzR6uH8udxbEnkyvQ
 M7vMZEfC/9d5tlkmjj+E8vPqDMq4vupNmdFOGC+l0raAv1JLGsQhl42OHHR6HHJ0j+Up8H7sVGx
 csBYb2OjVJ1hTFojKII/KNPNH0jX8wR4wozIMzjzvJHzycfQi9JsmiPa1YVEYmggWFpfITF8Xwq
 Do62EvTQF4ks7DrJPEw==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b0453b1 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=l1nHKxr-XrZQ-B15pWYA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: mkx01EFCEi4teemxChRx2qX8TOoBiZWz
X-Proofpoint-ORIG-GUID: mkx01EFCEi4teemxChRx2qX8TOoBiZWz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1OSBTYWx0ZWRfXz70bdxh3Jf1W
 ktd4MjPg/+cIpI5erazJJ7+WmLs9tgqNx2gllsclh+atq0PNroysd18m5X/76KNysKev/l0Z7NL
 fg5bgzw80UrPK1uhMsMBJcwRj3IhZno=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230059

On 11/22/26 6:12 AM, EMCP333 via B4 Relay wrote:
> From: EMCP333 <emcp@enser.io>

Hey, thanks for the patch. Please note we can't take anonymous
contributions:

https://docs.kernel.org/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

Konrad
