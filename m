Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785514;
	b=vxLscYWUseo02TJyOEl5S6lMCqrbiYsHZ0F/2psnveeudTslJl+7NrDSzq4bQUh7tiQh
	 /xTK7F7eX9jvAmrjX/hsL3oRxOkudtx24Ji21WELYn86Gzr+UKf/HeeljA4YIlQo8ikU+
	 eAxKUr0i1/2mIdT3qCwBayyeNZiOnkFibqgQ2T7qRm3w9ol43/fjv4XuYGMea6jb9vuDQ
	 YN/FzA970W8diFRnHNqRehALREwkB134/jsB/VW+lOsauS6s6bqVdtOsjSPspXqtafy2o
	 mCcQ9OLi7FalllyTCqakXsnmEsR7vkvKnfF99GEudZvFgq8Cjs9CZNVIhO1orP/99HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785514;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GyjZ9OVxjWleGjwvAkve5HzSuA11I1Ws4wIx3h3zzVs=;
	b=tD4kUdi4Oo6w4ze1kW5pesjxmjAMZcpj08cm70kOX6Voi5L7olTNs1cpuOMK4j8pkfdV
	 AM5obDvHVdVy6KfPI4saj+6inYw5XrYs380yLARmIvC9Lyijpg/9WR5hAgaOMfAfJbCMQ
	 QxyezwFZUVEKlpKU68fcf5NBk6ceAl8HrTYjfFjLqfACa/1rqs0EyobN2j21RvXxxZieB
	 LkJYVxSzXuft6+08YTVktwZOgnOAh1/msrE7O7ityHM9psgN1TPBTEKmren8otAXPP7R+
	 tvcnFGcMLZJOIu6PdWO1eV7GiARrMr4Kah3jxetP9PIRwmGBiOKX8gaM9wP2t39bU/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p80WorYI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WZEDsgZR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F875606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F875606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p80WorYI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WZEDsgZR
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARCh9FJ2920852
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:18:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GyjZ9OVxjWleGjwvAkve5HzSuA11I1Ws4wIx3h3zzVs=; b=p80WorYIro4ohzW2
	n7G2va8lfGKKOkZeK/aPziA/M/Oyv+ed4E7+40KYRy+BHTfPlETqTg0EVi4MklbE
	96bVLwkXnD1G7qHYs5TtpW9m7BFckXMwOyjpVuBOoKWv7bRhgw2XP2KlE52/HsUp
	ZwTtRzqDRN0KfHefjrP2LHl5nzag11ejIOGmPxFrwV9KznijZRw1L6COLByObHyo
	FWeefEiy8r1JqDhEAeUHz4i8R/OuzVhtlcHIykNHOSL2xgJ2v4Z2b3Eop0SVtEeu
	dZlXZbKN5G2GyrVyRNqKVXckT5K+ZQkO4KeFHfhkRBsYxVm1t8JIbVL6iHh6H7SM
	cyAnMw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gh9hw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:18:32 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7ffe90b2cfdso2829004a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795785511; x=1796390311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GyjZ9OVxjWleGjwvAkve5HzSuA11I1Ws4wIx3h3zzVs=;
        b=WZEDsgZRFJkMaMpvF0QTewBtzt3pcETbMpw179xSUzM9xw95bf7e2BxbASAlz09kUd
         xKHI04E9i5nXGOAt6r1z0fkusPZHHhvMzBRqsiOfogmt0lxOdnV5WhBMMJSI6Z/57qMB
         0SVfznkiIxzjf97Z2zFZG707cr07ftqESul3ZA6rlTjejPJhAT2c5RgKAq722VPRyF6M
         9VHJnsMYf2CN73jTMqI/j6a8e9fiNiDmHZdAoVK1BtGM3ohH02IdDMJoaJAJEG4c9huv
         Xh7eHTiAKI3R0YlANv/R1BnzLkoj9HM2B4DDKhurpkke9DQ2m83o35fmWQBAxPvzIsNI
         UwSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795785511; x=1796390311;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GyjZ9OVxjWleGjwvAkve5HzSuA11I1Ws4wIx3h3zzVs=;
        b=NL+DTOjndR74RSNSZrlew1Xa4X9Vk24FDv3tYfhT0XxU0LVHz2H/ZJfXjiItCKQyta
         2EJjJupNLDdMe9gLXgpqPeYtcep8yiqQwAH4SvE5yipDbILWq25Rl1GvY6dUhRp//dM8
         yYviYIbuDp4ZNx7ANgDYWTM6zEzE4hje9HrqWWiWEcea5D3X4tBGVRCWyN0674A2ayQy
         7wXpA1o1qyAElvvh+deFR6O+Q9m/d4riWR7K93wAfZ0PrGYNPtUF64KsQqXMa3LxARoW
         0bRO3Er4MX6qyVo/Fqvz8tq44JDLZNyBmwf1OC/0/P2TsZavXlc/ldCLOi7LzzSvCK72
         qZbg==
X-Forwarded-Encrypted: i=1; AL+hErF44/1nvu/ppu2aJpU8Xpmov92AcZnetCpHEZyhcWtLiK2HCXh5HZiAcd1zym+0u7vsRDFv+LjZOIKeJqY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uFifh+587iUx1gR9cTQ6Whf7uxjScqK7whVKc9HYSQaWCqq3W
	RsO4Wyl076FMpMLr2aCycGWQXAW1SGo0YT9NeL7IQipXbDBmjr8E/hBYql1OUy1aP8fAUbaK9bc
	r/rlO/W60MP5eq5ITHPQH6go/D2eZIVnlix/RQIvYL2dGDmMO7XgC4tcp5LISx9nZzCqNzbgruC
	k=
X-Gm-Gg: AZFdTZd4LFkA3ST8vFKsti61cPqdlFQ9culgxIhn54Bv1C6qbqaAtpEvx9Pk06zRkbw
	TE8WB6N8NXLpbddB17Zu2ZyzDt+dyGjOuAs+xbaD4Y2JHijxMN15yygHNttK40TTdngHrnWgKeL
	zdkLpYMtZLCwoaAdNYALcYsz+7EejDQGnBvL9Ro8Sr1G2qql4rnAqebPkaQcxMR3zIg35KRV4ij
	Y+VEM7UBRsQbyQnsqLHi0ELL5bhJgUrWSwX/3S2TfplMQoAF0Ako/o2DVVM6BFkwggsoSgyTBSC
	ePwDdhDGQcC87w0ugQdrslfo7a1ljQRIDPYyK0KE/qIOKWuWcYvhY2VNVVWQ/U72/YVR5Myy2e7
	Mpafahs4ecM5tt5rZUvjP8osIEpL5tjmhEkMSudd02nmD+2pAGhs9ZETqUCfnDMUerGPiqQY=
X-Received: by 2002:a05:6820:c2c9:10b0:70c:bf79:3e6e with SMTP id 006d021491bc7-71b39033ddbmr23721612eaf.0.1795785511309;
        Fri, 27 Nov 2026 05:18:31 -0800 (PST)
X-Received: by 2002:a05:6820:c2c9:10b0:70c:bf79:3e6e with SMTP id 006d021491bc7-71b39033ddbmr23721577eaf.0.1795785510904;
        Fri, 27 Nov 2026 05:18:30 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36e362bdsm11167573a12.5.2026.11.27.05.18.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:18:29 -0800 (PST)
Message-ID: <26b2413c-c705-4ed0-be25-ce5ee265e395@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:18:27 +0100
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
Subject: Re: [PATCH v1] arm64: dts: qcom: glymur-crd: add DisplayPort audio
 DAI link
To: Rohith Chiluka <rohith.chiluka@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261105104657.621104-1-rohith.chiluka@oss.qualcomm.com>
 <e24d7d8c-ee7a-4a83-8daa-4805a7920f44@oss.qualcomm.com>
 <52890e46-95e8-4bc4-b2f2-03aa059b59a2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <52890e46-95e8-4bc4-b2f2-03aa059b59a2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1MiBTYWx0ZWRfX/eWCLr9vj0Zh
 7nm3WeXPWVhbRPRqZkbBkF2jaYdaKdQWL7mVgJJR6KoAh+rMaY3quX/lQ8zamaXkWQV4m7ATbLC
 A2aaJ0K0tIak4uDBROE7RUDZV9F2Q9Y=
X-Proofpoint-GUID: aUEJH2XjEw0lb2Rf4QMOTo2eDhoiU_Wr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1MiBTYWx0ZWRfXz0TTuHSsNM3d
 KhCk9PzKTbbJoK4EC5pdt1T2e91flu41lvRS29Eab3QvsgQAt1/r3nxm2m9HwkdXPE7E+FOa9f0
 cX6gZyv3cUvhT63Anw1B7MWTrf/V5pHEL7plMGkJL/Hk0LgvpQso48fALW629roQBnPcP9dOH51
 hlmzI1hskgfJqUUHm2pXvg72n65Ow/8Zsg5gyQWorzU4KWKVePt+1o9/6bSZLh5zkFlkDuMU93l
 lwRvrkAyWTg9CP/W/AsZxyEdTQ1K5eqLBItmVERGgg0XomcRnKUakJVXWAHtwr51u9+WZB+H7tL
 G6dOhdp+iyxMXXr634mlaqCscm35uKzU+fMarCU/BvgCuQ4KeTUE3oke01BkR1EC9jCZszv2Ns/
 5OSvY3K7dq6vObl+2zE3LhT6iyOXPF5FWgrRGZYgjnhHH6F6ONoMvf9PWxNuqNtLgOiZScE9J4W
 npmAlhZcgRuQJ76oVPA==
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b098328 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=T6v-2sJnNWr9hvUYHbYA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-ORIG-GUID: aUEJH2XjEw0lb2Rf4QMOTo2eDhoiU_Wr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270052

On 11/16/26 2:24 PM, Rohith Chiluka wrote:
> 
> On 11/5/2026 5:37 PM, Konrad Dybcio wrote:
>>> Add a DAI link for the DisplayPort RX path so that audio can be
>>> routed over DisplayPort on glymur-crd. The link wires up the
>>> DISPLAY_PORT_RX_1 backend of the q6apm ADSP to the mdss_dp1
>>> controller, with q6apm providing the platform (DMA) component.
>> Why do you think we should only have audio on dp1?
> 
> This patch series targets |mdss_dp1| exclusively, so |DISPLAY_PORT_RX_1| is used here. Support for |mdss_dp0| (and consequently |DISPLAY_PORT_RX_0|) is planned as a separate patch series to keep the changes scoped and easier to review.

Every patch has a fixed cost on all sides - for the submitter, the
reviewer and the maintainer (as well as everyone touching the git
tree afterwards.

The submitter has to do the work of committing, writing a thoughtful
commit message, ensuring everything is in place and then finally
submitting.

Then, the submitter sends an email which reaches dozens of
people, actual humans, both as direct recipients and through
mailing lists. It also happens to cost machine time (which burns
coal, gas etc.).

Then, the reviewers have to receive and read the email, analyze
it, check if it's right and leave a note.

Then, the maintainers have to pick up every patch, validate it,
build-test it, perhaps run through CI separately, sign off on it,
push it out and describe in the changelog.

Then, again machines have to separately process that on every
step and on every single further git operation which now has
more history objects to dig through, wasting disk space and power.

By manufacturing work like this you waste all of these resources
(and on top of that, each one of them has a clear monetary cost -
be it utility bills or workhours) and you have absolutely no
excuse to do so.


In meantime, Srinivas submitted a series in parallel doing this
work for multiple Glymur laptops at once:

https://lore.kernel.org/linux-arm-msm/20261126183806.172485-5-srinivas.kandagatla@oss.qualcomm.com/

I assume he didn't mean to one-up you and we normally take the
patch from the first submitter, however that series takes on a
larger piece of work and we'll be moving forward with that one
to avoid cross-dependencies.

Konrad
