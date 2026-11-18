Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794960534;
	b=qapnm3deg6qM5A11l30jDG7e+b/JlI8oaa7ad3jnpbQNewB9MbJFqI131LR4fLT5JbfZ
	 AS6l3qHD0KklCiTIrZOKZeb5qV+ree6gjmlsystgUKaO/yDw3ChHhx4RDM63WTuCVovag
	 SeIdqx7xxIi7uBCEYMERlaWrwvx2IR6HQ8qfcmn3wlgCp+6J8AGKjVzmD6QBrqvLCr3Cb
	 Kcza4SoRPk25ssI85+Fif07U/oWQD0rtY9/zKRmWepoyMb8CFsknZ6l/3GpI72bBwDDnn
	 lp7T8/Xvh2qDeAB7JNcL/WRYs73CahEoARhk4KC3kMwCmCdMrwUHxAB/7rJ7xg8RleA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794960534;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JuTLbTugfbF+YGTGMHC13Lp2sz+DJ69DPTAGTG1eCEQ=;
	b=f9APaawStAVHmw+ecBCpblmknznzzIVxkx3Z7rHCaP23tbg1LXqkZABe38PgxHl4VNdG
	 NtKDC6saQpYpY0DLvnpAa0330/muhRVfz1Ho/uDKPo5JuNqRJkWwDrW6YHThFMrzA3aP6
	 1r2hJ+zY3dtdGFW4zXmGbrP2fPmsU8872jZdlyMDyqYYyS4tCnFRC5LuaZc5Nopnxui93
	 OBacb2R8A/omh9SiG/Z5hcvov05Xs1GWqTLM+Lq/3Lx4iWNHQqLKUkiALgI7skLDpcwfq
	 PCjIfJqgUcg7MAPWHtfnO2VCgYpwkCX7VLnj0nYc4GV+q2yivgrZ7cyqylnn429o3bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A4Q5O9bK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KrmCNKQ7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1B4606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E1B4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A4Q5O9bK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KrmCNKQ7
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHMer5c4171927
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JuTLbTugfbF+YGTGMHC13Lp2sz+DJ69DPTAGTG1eCEQ=; b=A4Q5O9bKjDBiw6Yi
	ddl0tRxJT8Au6jdyHYTBtKwFCMqX85wHHAh1311Z/Vx9TGJ41gEJS8fvjPdMTTW8
	/+xIIRv/JWt3+wxPxfT+Rtg/T/wK25Q4pVDRMK8/LdHE6jqIMxJY0eIErib7DKwt
	PNPJbjzcWGf6U7M/DAEwA7pMlUse3e/O9h6NvV1lBJwyFsYeblw7map8t8xC4Zpy
	KtswgHyEXTKkYWs1km48IuQ6mx5wfumcaEmBSliVJMZPUyk6VYC1RmFbw+N74Yc+
	s6Kb5q4H/0C336WVhTuShkR+dklD7F1Ba8jzgxZeI54CPpok2Y1lYvJn1YVZQDl3
	C2LC3g==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8899y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:08:52 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b3a348a6dbso796195c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794960532; x=1795565332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JuTLbTugfbF+YGTGMHC13Lp2sz+DJ69DPTAGTG1eCEQ=;
        b=KrmCNKQ7cl/vxw+rQHnRd1OpBMDjHCdtf7t14w3U+alFXQN556cxHH5t97e+nCfmP7
         vIu0SYTI+ZvavbPP5NzmVYxloPge/wJbZLuL/u3Q6TNYCm2MtRrcfIFDxybCPmFGmukf
         3su949cMq4XYmqZzwhWEfWy8sm0qh6Z2FIoJ8pAT81xoxZ19U93aROWg9C3QQzkocTh/
         4n7ojqjnc4/WKs4xGd9XqHk142k/9j+rvRHU5BrrsB3kpGpr/WJw/edJvhH5JKI+AA8r
         OgACGe6Nxbyt+k+wraPf9hnjmnbKQz0WdidMYLRdxXtKTvirZkaVaT8IF0UkZ1q3S4BM
         5sKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794960532; x=1795565332;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JuTLbTugfbF+YGTGMHC13Lp2sz+DJ69DPTAGTG1eCEQ=;
        b=GfOD/OwETxlG2ncCwEeRLYIz9P0LIv+Q8vtzSE7F1lfkfotaDyUotlAWRoG04WTsQ6
         DK45e1jmUwmlRvUTOoc2wzBVxlO3Y3qp86gvOBUxCBoj+Fb9WDlMgKriNV40pKo12dyq
         hRnHfhVBDrNphB8MOHuO5cqT3kvkzjF1k9BateO2darb77ZAsDF1LmqNpNBrPY0hqlZi
         cVWR0J10gTdHCvGEyQOYJgC3OFTLG60cihe3ohXuxywVoQfV9oBDVNqtH/MSOVUphVHC
         eEuechE+XKHy/Xd/RMFhwyzOdnfZ+cmPltWlZrsRjUittEc8XpIGeAHj7y4ammJlHCoJ
         TYHw==
X-Forwarded-Encrypted: i=1; AL+hErGVHwFEl1NRPU8JF+CXDY1IO5SC90tArvib3b3mFqrEFK8Zo3pXgvb79W8N4lH/HoKtkJPAZuQt4t2gPIs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IdSGAb/2BNshBUWPDQ484zv8afRYrXjDlG8iUt333Zr99i55a
	nleIcV8VZHWU/UqW5fluOTljBY9uWgK66YDrkO9LZamTPGbBdx2BWlvaxUFWPP3cw7024QYaaBV
	kA/nZin1Cq4E6IKCvkByCif66az2qxkCk5r+AGQDX4sGvHvwT7XnIfrF0NzrVGowfBvM=
X-Gm-Gg: AYBFou0WG0vdwzjtoZN1v1POHMovyUwnSeloIMUNK+0PJahXXuYwr4xLm2RaYSe3arc
	o/BSl3BCbhle9PReNcOqqJpPawO2tdFOxJYPcO7qjbn4DHDJXAPavKigkZNlfCWsqnVEeabHTb0
	kAw+IRNYzOALVAFpqyVWMmpSDiRnYdc+Z+G6J20/b/z+xUK6v3wKRVjyyYiMClPVp5uPqBDd8Ca
	YJktw+c9GxgavKEBUPT4Rl88L2O2JFk3CsC6z0gZ+e6O9j+H6vnVqt/n3BZPZ6PP/ChwFfJf3Kw
	aF/TDJlQaCl6wnwWUCr/7Wim7RR1cukX/aF5I5bX1FHiMkosg/sdnFMtr601bNFA9hx0tWqr/ba
	J7qJpzOTC8ljHntnYxZYcaMduTMNoTH00QqmmVd0WvgSG4MtZWuPs+13mqLwFL1BLQgrr+zJjpK
	iKEpRSV0qadCIVu70AifCqxJy9wTRX8w==
X-Received: by 2002:a05:7022:7e83:b0:1b5:23c0:4f15 with SMTP id a92af1059eb24-1b543c3fd9amr1137363c88.39.1794960531466;
        Tue, 17 Nov 2026 16:08:51 -0800 (PST)
X-Received: by 2002:a05:7022:7e83:b0:1b5:23c0:4f15 with SMTP id a92af1059eb24-1b543c3fd9amr1137340c88.39.1794960530842;
        Tue, 17 Nov 2026 16:08:50 -0800 (PST)
Received: from [10.71.178.189] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447dc5e9sm2262069c88.11.2026.11.17.16.08.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 16:08:50 -0800 (PST)
Message-ID: <39bcdc68-1925-44f0-9958-e1253452c113@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 16:08:49 -0800
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
Subject: Re: [PATCH v9 0/8] Improve Qualcomm EUD driver and platform support
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
 <57c5aa78-a116-45d4-ab32-772cd970e6f6@oss.qualcomm.com>
 <2026111740-florist-conflict-eb96@gregkh>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <2026111740-florist-conflict-eb96@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ES9IEqIIu4RsZt1waWOdcZ4CF0V8eX0E
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afcec94 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VfwtAWXQdzgZiewqWO8A:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAwMCBTYWx0ZWRfX8tnxPQ2AIQrf
 wXNNnHqHLlUfMwEFZeeBG5XGvilTweHvDWwWlQ5hxCSL4k90jTtGt3s+A1xFoAI4J3XjBIo/grF
 ES3HejBlkx1dwFxIRbz0xx7G5rDDjO7PKLjn+GpM0lrm1FlSdLYggflUIV0eNraYkYNHEyMFIdl
 zGOMtflGXqd0GgVUvpHZM3ZDZPh+AOCiYXSa0aCh9WBFk/7I38q7qKaGDhi5vrImeFAjDMM9m1i
 ZdfMatRjPqAhHN8cdF8UTKAeztxnATsBD4lmX2eakI8PVjVbwj/4BbX8bIAQliXvOGqyHXYpcRA
 8SQZxcNMxlNchoYBoKYCCxh03G4qWKZwxQ97oHLHvWNf0JEa9oZA/bHpX03Q+9+rI3gsUfEXZoK
 7BDW3rCWui2DZYNtNrwtmQ3qg/+O3+tffcfqXwOkyiEeazYdETnqphUutHnI6YVry2jMnT87D2w
 0d9mTUyd/I5m6qVuCpg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAwMCBTYWx0ZWRfX2mWpVveXINFw
 1ub+FrW8LVAGOqPhCLCeCrgouxHBFWNFAQ07Keb5b4/EAYcMKEszbLb1cKXodqgLE+2twl+wkPI
 6CLPlMCHqFK9z0O/ZaHgKdutDJRiWj4=
X-Proofpoint-GUID: ES9IEqIIu4RsZt1waWOdcZ4CF0V8eX0E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180000



On 11/16/2026 9:21 PM, Greg Kroah-Hartman wrote:
> On Mon, Nov 16, 2026 at 04:06:52PM -0800, Elson Serrao wrote:
>> Hi Greg,
>>
>> When you get a chance, could you please pick up patches 1-7 for the USB tree if everything looks good on your end? 
> 
> We do not just pick parts of patch series, our tools don't like that :(
> 
> And why top-post?
> 
Sorry about the earlier top-posting.

Understood. I will send a v10 consisting of patches 1-7 only.

Thanks,
Elson


