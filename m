Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802244;
	b=BvVf20YPKj3WPHR6AYfCC8ks7OVkIp8BZJVr36gZXsK+3Ae4vFSFxq/k4mqwL0Aag/iw
	 1VlfjbvLcBNFDQqURnz5cAAY4qcB7DBvcZegPgXp9KWEhvqS96n7M7kF78ULWyj1mPtkz
	 BM52NepE4dcREo2O4LypQjx+p/sIWVE5qLunym3Km7odslj/tOobY6SYKIFR9yT+/NVmJ
	 GSRqQsIwz/lUBSYXmfzQHkNHy30eojQrcvYbI6UwCx4mJXMgx7cqDd5a+/G4zJcefo0Ya
	 AT+vSVpGdLZfrs8tL39dmk88T0azRhhqaU0W28YMrSm46aiU4fVsatDvVEunSVEYLeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802244;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1sBkP/GHIRoxeBOIU2ajZas/Pxnq2QY25WHx+9A55ac=;
	b=mY1nU0636LCkIN8KfYj1FFWxx+1l7S+gpd3dXHbkiEy6BL65uP05w/5j4/Z3MNMi9jN3
	 yB9UNJ83ToK5p58IzjrlVVepDc4Ig33aPG8KZ+itgb/+1ikGc49XhfpX1vChsjQAVfEdd
	 lXwgftVGkUmoI/sNWDbivh2bYNDShuZSlzOH9YaFKgFV+o1XoO/Tgwv5Z0ieAjAlODV3g
	 5xEqfFZrF89GGvdrEQ2h63EYpA0XUfzP+p6falKxTv36VC0rXKmwIv8mDeomPHxFtWtC5
	 o2+JakLw38YDkV31B5rrfeGJu6Q+vw2jE9bSj9vM6vJaARxMQGmc7m7qSoT4W63eFAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KEl2o4os;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Va9bck5y;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51C2606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D51C2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KEl2o4os;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Va9bck5y
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFoulv2923812
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1sBkP/GHIRoxeBOIU2ajZas/Pxnq2QY25WHx+9A55ac=; b=KEl2o4osfAgukKcU
	37hpQXKY6CxJAv7BBYINoD1KvD8kWG+nMULQeJIxpMeo1y7K+8/MuuGaTyJ+Zn/r
	XQjkWia60eCzjywUd8VYNCC7OiDiQ6cUCTsNwenDZbW06M5LiMIu+ugRnU6QpDKe
	iyF1ngX8K+EQpOOFh+g+PgoeuWFLXyrfi9DcTBmocl58VbI7vWEZoPZ3hplPIS0M
	wdwrrgdWrGkKQgEdXfkkPbwmRXT7U7xY+1Cumph4cJqrCrnvPJyggC/ZewOrDjT5
	i9/sukuFaAp9fQLocZJt/rP/Pd81Rg1ZejWtCGM+l7SL+6l9rTC6IG/Fr2us0DJt
	TFTOfQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhjq73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:57:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e92aad34aso1391372785a.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795802242; x=1796407042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1sBkP/GHIRoxeBOIU2ajZas/Pxnq2QY25WHx+9A55ac=;
        b=Va9bck5yy8IsGv5b1ne5rBRXVXiM73mXS1FQQG7hRPMGRA97ti5MJ7kvVe9f5AX4JJ
         ET8McujWuhWLmV2/btg7aQz5UK3wFJZo3ckAJd6vBBbghY7puLhl1Sx0A6AfeylV4QYX
         Vzyc+iBIW0CTVC0wOlu+Gq1mBMvWZ2rpysp5IzcC3EpbwxEGX2FzQsZfojv5hKsfmzJo
         jj272c/aB/mEwB7KrS2BiJ/WgbeQ+VbAIkwxhlMknpxxNTc14EWANcmnpapAGiYBuwVK
         jk6HqHfRubUFwsrjdq4gNuK/rWZcbe9YgAIK5bk8PlP5TVpxN0ez4S3FC5Cp51b7YAx4
         gJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795802242; x=1796407042;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1sBkP/GHIRoxeBOIU2ajZas/Pxnq2QY25WHx+9A55ac=;
        b=gLM+FTaLtI51FsmcXqAceMR8435eSAPNaCcXeIDa/lhuXEhHK+PS/6fR3XKp3WPVTk
         O1tbEWNTrjq6ALX0UA7ZbywGwgVETM30DkeAn7tkUwM6riZJA06U3uBJ89SeZzp96yxL
         u2j1mTS1ubzRb5F7f8clRcWTWahoaWuZGJKxETfBuL5TkfEp1bx/LNOWAhMtBdrUl0Q9
         uxt9C06DopWmwnW7dhCYsEURy7jCQXJMheY32uELIW0aJGbr8lulFKrQZVFX7obugviL
         FeQWEWitmUoiyVisptc3C9x1bZdTY6RnxOu3tCfwn0vZyqLEYkkKTXqtwjEUbf79VLwZ
         7ypw==
X-Forwarded-Encrypted: i=1; AL+hErFlJUrRJB2+07ahxwC5VkW3kCIXLnnCU1EnTwrsk6KvBlnXUWLTNDkaHRXuae2ZXNqrO0SIO032s8yXd7k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gzMtPqb2eKOjfzBopqZ3PvvHyXu5hrZpzBvYK0LbuWdonL3Ex
	lN8/LD5ru0t9YiOWUdW5qSVC8fUTaql84sWmkEzEp+qQqULMHlk5ZmIXq0FHJfSx+rYHvMHvMlA
	aY75gQDrIOQs1N+6mH84gYIpj7tPXZLeNcnksS/WvLZoOIrjUz3NZXpN+lx9SLAL64YU=
X-Gm-Gg: AZFdTZdBWrYwxpYF194Ts+Q25yQG3O2gErywnrL5qA4Azh8GkPoTH98IWCCP3bU5J1d
	OTh2uaiMRoe2qqNZhmOiAFwNnU/4AxMgXcInmSkFY8cuV0dF7JGiwzMcRZ3On+mEwR4HVFAegqE
	1scz+GYRW41lvscKNhNdAAMk1tw7ICjis2qWQYlDVs9HJxZrqOMbCKd3kQ09O9Y6T8uVPbL+Xau
	w/8vtEyMGm6DAHlt1FD7tCmRBScUnpcgCDgCo+KTW9IZ/PUErkX9yHnwycmO2InPb7DQtxTyDBh
	p/XHHLwuryEoCIi0mzAgWrZwZRlDBwL4rdZ2EIkj7Xj8H7d+bOHoeK9ctDb1q3ykCv73Mh/c9vz
	V7MikQZVWRrF89PwjS7jlhizE6Zk6Bk7IBkMHaqEBrqDanrmeDK+1XujGaOmdA+aL19eBLbi7AY
	Pf1g==
X-Received: by 2002:a05:620a:4142:b0:949:3c50:135 with SMTP id af79cd13be357-949baa13071mr4393792785a.38.1795802241956;
        Fri, 27 Nov 2026 09:57:21 -0800 (PST)
X-Received: by 2002:a05:620a:4142:b0:949:3c50:135 with SMTP id af79cd13be357-949baa13071mr4393787585a.38.1795802241393;
        Fri, 27 Nov 2026 09:57:21 -0800 (PST)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm48952429f8f.52.2026.11.27.09.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 09:57:20 -0800 (PST)
Message-ID: <cfacf655-f30a-4145-8748-271c0e8ee4b1@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:57:19 +0000
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
Subject: Re: [PATCH] ASoC: SDCA: skip port channel mask for Output Terminals
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261123165612.440542-1-srinivas.kandagatla@oss.qualcomm.com>
 <awR2ML/nYeYHrUpB@opensource.cirrus.com>
 <awcdwnW0fyJFOzaM@opensource.cirrus.com>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <awcdwnW0fyJFOzaM@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA3MSBTYWx0ZWRfXzYw5uYHr84sy
 uv9wxq8FXvryli0OU6JdI+C144GHLDqgZqrPXXxg1s0eFBZVmX2dsV/5u/zr3KfepR1wnaMmhnu
 jq8pXyGsHIFiYQMQ7TMwE/MzhEKMPrI=
X-Proofpoint-ORIG-GUID: sY612cUY_tNomQ5Qa661jbBJ7NGCBaPj
X-Proofpoint-GUID: sY612cUY_tNomQ5Qa661jbBJ7NGCBaPj
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b09c483 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=WC2J5OLVSIRpDh3yi_wA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA3MSBTYWx0ZWRfX8UGyRWqUhGYQ
 0ZwFlxOUe23ozsL/NEquYWtA8tkw2qYbm+GfN3AqZqa/3qLS1f+gis9/i+fueEjEXy1vzXlYjgI
 m4qPGncf1FKTr4w9MLod/UnDQefafC7LZ+oCrB+eEmq5cXctYMK5SDbiCz0Z+27bEWtzB3WAck3
 +M+RvZYEiX0idGr5aXDD5QYBGlEkI/KAMIyxQGE0O8UssxL4V6zbrdb2t4F1Tz3kH42mgYfcL+Q
 i2IPtM1NQUgTsqd5vxwXdV8ViI4Qgz876VcrvoXwIs1uYB7j3wrHmhJKy1sIHg83B8tkCEYgAWz
 5nIbQCbcwQvhIys3sbs/68PUXUplkZL96GyYFLm27q60JQyL8WvI5rMTotZ0RBf9PQhOYI+jIKB
 5JqAmu12u4IBPO9UsCXs8fHT+Tr8yI16w07rqDdxH+RBEXhYx5xpkV7VurTYJ8+GwK45cED3x2b
 s2tgNHsmcqDoF375JYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270071

On 11/25/26 5:41 PM, Charles Keepax wrote:
> On Mon, Nov 23, 2026 at 05:21:53PM +0000, Charles Keepax wrote:
>> On Mon, Nov 23, 2026 at 04:56:12PM +0000, Srinivas Kandagatla wrote:
>>> Only intersect with port_ch_mask for Input Terminals and leave
>>> Output Terminals on the cluster mask, restoring the behaviour
>>> there to what it was before 8bb24d87078f.
>>
>> Ah the joys of DPCM. It feels problematic that the backend
>> constraints are duplicated to the frontend, when a significant
>> part of of DPCM is that these can differ.
>>
>> The "correct" fix here is probably a bit of DPCM working,
>> although not sure how significant that ends up being. I have not
>> spent a lot of time working on DPCM.
> 
> Quite tricky this, at least on the DPCM systems I have (Intel
> based) the primary CPU side DAI ops seem to live on the backend
> DAIs. So likely we really do want the backends to use the same
> runtime, but that makes it quite hard to know what to do with
> those constraints.
> 
> The params on the DAI driver are folded into the
> snd_pcm_hardware struct, so maybe we could update that rather
> than using a constraint in the class driver. The DPCM core then
> has flags to decide whether to process the backend codec DAI
> drivers. This also comes with limitations that it only handles
> min/max.

This is exactly want i had in mind aswell, this way it should work for
both the cases, I have a patch on those lines let me send it as v2.


--srini
> 
> Or maybe we could do something like an ASoC wrapper for the
> constraint functions that no-ops if it is on a DPCM backend.
> 
> Both of those approaches do have the slight ick they basically
> require you to do special things in the codec driver for DPCM
> which feels like it should be transparent to the codec driver
> though.
> 
> Thanks,
> Charles

