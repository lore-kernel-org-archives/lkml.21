Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447203;
	b=y+3fEhA+QrOX5h4ZYlLLbaJLzjBCporGbA7BXVLyqZKSQZnn1ds1GTqK24Mw4ieiIBcx
	 9ykDzsZSmcVn5tdbn+fm0pvOkY/X9d03obYg/sUut3vX+xcmfKLA4buRdmf8am0EiF85Y
	 HdkomRSYAkQeN7I2LICIPPq4LTKVXjcDnoHVJ9TfrqVNoWALNOwThtZnpodKEh5EuFlL8
	 HdByZnfvGCM+3nfygS+rdy5Fcdx4ztDK9sOQT4toNKFVHfecaSvcgc0auYYuG1BiKuSyL
	 Z0y1fhMQRJuWyUhvSHD4dn+lq37aHEQoqKJkQRnhk//WbGWRFhYHZrsgMES7DQEhblw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447203;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TD7NnETHvRqTIKcFjw7RViMYq2RFxLOt/Tq/0tVAYoU=;
	b=in9NcO/SI38gAMwtStvuja8gGJMwZQaQZ1CNuWezfk/ADnzTXwo24JZnb9evTBF58lAj
	 AmyO0ZV3/K+8B5aJoVf7Om7zC17EKAYuuA7q+Ze9YzAAAKSXU07EQy7D7bgsvuGLZuQSg
	 Ueu3bHq3KawqL5B8UrWtRzFzDonhj/HfY329E5KGg7tWuo79heoXuBy0SFuq7kVMhmt2E
	 nT6tidwdehbyA6FVQ5uwqWbG4aCGHL8YdVQJADf7B01YCiOgIPKN0MVnOouMtsA2cS8N+
	 zSXvFWHNTKDNZ+C2QlK+i9ConKsMWdC5ONRG3WP/uyhC3O8ruhzApyarMz7eo/3VwrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gEPJcTQx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fg23ibzu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5BE606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:20:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA5BE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gEPJcTQx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fg23ibzu
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKwR41937644
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:20:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TD7NnETHvRqTIKcFjw7RViMYq2RFxLOt/Tq/0tVAYoU=; b=gEPJcTQxbMM2ttVl
	Jn/AleS1ZSeO5Q716XFm976lbjSqpA/bCQRTSzLvQbNH3q7j8odJkAvHdyotRZ3O
	NXN/NSp2tnYj4oXtVEcmPYYsPq8MAUS3RsHrer1mXvvewYqhfwHW6rKfIGTBo0SK
	+9J1jgAPUJypn5dTywm1nqCYr5lGDJxQVhe68qWZuqpvJu9ZBeDc7iT4rSU77YMN
	yr9wNWmPMXB4PSZJvaQnBrmC4p+3tbk0SoNs2mMc5NE6Zm27X0kUv+gwMHOOVN4c
	oJ3Os9UbOsdUsu3yQjGI8xIwWQZtNaNXxEiC8rfb1NZzjCpnk+aAPs3UT/dVqe8G
	0DILWA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx2856-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:20:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-949664eec1fso37700185a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447201; x=1796052001; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TD7NnETHvRqTIKcFjw7RViMYq2RFxLOt/Tq/0tVAYoU=;
        b=fg23ibzupk7viDUqik5UeFCfKRXZOfTF0r9rZdBSJtmMBCLUfSiSk26MR52tlWgFzL
         N1GZMPLWO5tIyXfPriWpP00V+AXK1QIJ8Onz00oYejDB1yyyPLxT4BoJVP074UcFN2dk
         wJrqu8+4X6CmGyvX12B+PRZeHyKb4fpQDggZH8TE/X2TYTkBx53NuU5S7m8TCjyLxfuT
         dC1zh5wuEAyoQyMJmr6K4Ayo+8HjCo64LuN0+qnYPyFjbo1KRSzGuOzoRvZkQKtZsZc1
         jqoW6d7qz7u5s9KWqUj3Rw11sz/U6aUZTW3rxVcWAJlSbwGCmH9+6hGJyl0M5nZ6xeih
         YmXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447201; x=1796052001;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TD7NnETHvRqTIKcFjw7RViMYq2RFxLOt/Tq/0tVAYoU=;
        b=lJ1m8PcjFpjqUmh046FsJX5yXy8uKHeKt6EFywzRrMS1M67AlIYHkzELuChe+866YU
         2813KhEaLqODEhREz/BTgxuXldhfpxRMlU9bYxMqL5kvA875zkJ4tDuDl+Jry4flwcFt
         Qa4WG5TwYMIFnRT4e3oWFC8ir6heuWV97cjAEmw6IsLnTe+C7scQGe1GVtZNC/jEzvT+
         GF2a9lgwoueD2USM/UH8/UFW6oV2AxtWzjCok7ZA4lgGv38w2XaWqD6FIGHLTMD06zJd
         W6D7mSy2Abg01Q9IGeAysrQL/7v841DFTmfqAGU9SbngpimvaIxXkUlYI3Rg0sF/x5kk
         yhUQ==
X-Forwarded-Encrypted: i=1; AL+hErGwbDmnEcVkJatTTNnF2gl2OnoHSU0jhlEI7tdEucRs5cc76Q/Wci1+BZiWV9386GWHGk8huRqgdE4bq98=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GsR8pUiACJZNzik2m1CDThfs/ZxmTOBASTgeo0wGS2X4JqR3E
	l28YL6s81umvVbsFuBiJXad3ANLatrTd8yvPC59Xj187rfM9hGdmcCuXNtlCJQfQbWHK0HvKM1J
	4z5mWOmoYRVoiLQq0uLuawyWMkWIMiSbv4ZriWrrQKwjXucg+LlGEnnGte1B/YQOlor8=
X-Gm-Gg: AZFdTZf/LnQwbLZej2751a2+loM9wRad4HHlPs3Ex/94Rp4dJTJpxaqyMbirnonJi4z
	OsWJkSDeG4lPmh4P6bCkcYNbz+8atGlB6gpTspi8CI1a2G4eUaXjVcbI0MNj5bmMYmRu1stqli0
	/dDyjTiZ3JNsPqmESI4qMA+yNz218dF5cLZyKP8GLUyoM8fkadC7/b4lI7iURFsfchy9AW1Go6q
	mvgPGVqYxy+1QKUfAQJDUBUsBB0bf1alnSYwXpcgpjGig3ARKmqZoFLXoaqC2MNbhUrphl0vouW
	pj9otvgtwsxHNwLlbMz7BkyjXB9JsEhOPVMaDXi2hPYK8K6fE9UplsS9embhJCFlofXlUXeLlMc
	3N6+/PCgEh19oJpoYCMeM+iQgPlzX45h4xk8w1oEMnNt3rEFCoC8zOzFo2ItItjAfI2Kt7NQ=
X-Received: by 2002:a05:620a:5636:b0:949:436e:45f1 with SMTP id af79cd13be357-949ba6c7b41mr2244317585a.0.1795447200714;
        Mon, 23 Nov 2026 07:20:00 -0800 (PST)
X-Received: by 2002:a05:620a:5636:b0:949:436e:45f1 with SMTP id af79cd13be357-949ba6c7b41mr2244312685a.0.1795447200081;
        Mon, 23 Nov 2026 07:20:00 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afec08asm423197066b.73.2026.11.23.07.19.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:19:59 -0800 (PST)
Message-ID: <c7d5292a-86eb-4be4-b5bf-974a54fac51c@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:19:57 +0100
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
Subject: Re: [PATCH v2] Input: pm8941-pwrkey - report wakeup events
To: Michael Auer <mick@yoxcu.de>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261123130336.1316006-1-mick@yoxcu.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123130336.1316006-1-mick@yoxcu.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b0459a1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=MRTsC1I0QnlaK75AdyYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: JQ3YLO60Al2CXKaqRrGl_54-cr2YZdcK
X-Proofpoint-GUID: JQ3YLO60Al2CXKaqRrGl_54-cr2YZdcK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MCBTYWx0ZWRfX4QrdgUGAQHI4
 QZKfVDy7cKWAI7P93oeDaWogYbTIO0ZdgqkdD+FQuJE7SBt37lBLjlq0x1rht4xaYGAL0oM/oW3
 HQXyHOcXInUu1vhfFn00YKr6l7nwtfI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MCBTYWx0ZWRfXyojEB12qrk5Z
 BpHqRv68fQw4uECfagN+S0b7q2Urt8gJ6+iAGlwsO93O8itOW9dMnsRpRc0uV94gC9MogAO0JAj
 tP10obMVbbuglptiLzGKbQQJaM60AKGsXmSTM1UUxjXjGc9eSSKLQcCQozC4ibRHgC6Fgq4l6rd
 zJgDXw+hgE4T8ESnnP3rMQYx3x6vN1jBKmqSI4AeN3XHo3L4Vj3vxyMDKT9PpHTxGYWwhjsli6s
 Oad/tBDzSXqjcU2PyRFkhJ8vieJTCUfJUmoae8OrJEFeOhDz/jKWyKFum/rWVri7UwBF59BZsFb
 IXc/seTnI0brzIRttIbDMzNu1l5iwVZh0SCUdHTmmnSUceq5N8FjOozjBobk4Nw4OtXMGJNmpRM
 +50Trb2g/guLmbc2Df6OKlQhMrV3noQ7Opr5SBPNQvG7YKBd4H552ccSq1iKftkNuLn3YqrKwOG
 eYPT30goFaaw3wsfA4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230060

On 11/23/26 2:03 PM, Michael Auer wrote:
> The power key (and resin, with "wakeup-source") is a wakeup source, but
> the driver never reports a wakeup event. Its wakeup_count in
> /sys/class/wakeup stays 0 even after it woke the system, so user space
> cannot tell a key press from other wakeups. PowerDevil, for example,
> uses the wakeup counts to decide whether to turn the display on after
> resume.
> 
> Report a wakeup event from the interrupt handler, as other power key
> drivers do.
> 
> Signed-off-by: Michael Auer <mick@yoxcu.de>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
