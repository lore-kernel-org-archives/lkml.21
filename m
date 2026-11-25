Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607692;
	b=PPwAlz3XT2GoansvZduwBG2ey1JKy+reIqUR/RbGfmFo8GZunHWoi0EI/DfO0+ZvtCs/
	 6nfgth95myIoGx0OkxIQhFRwPMlI5T7KE/l0Gj4WtFsWQ7BFXbF53GbahioDWdO3m+0rE
	 iuIMQvq3fIpFPcSTTZZ8Bb8WeOuN4kOmzjNv9Ug1GscOpr6j+brO87kJbztSyqfAH/MYV
	 a23dsoLPS/eoROuZgSKnV061wdniFZgUZ1TZTWGSfjGUfUjLA5PDVSrvLEUTUeTvZYniM
	 8RmzPPKi28KafZpBfcckNLksb8i79zp/0rLvzODne6bapV+buDCmxtuGeJ/XNjhlDGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607692;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lTb1A0Hfb5XeXnPFSrjY1zIvAVboe0+YM7ZLM2/CDL0=;
	b=ki1WoFhIEmhdfcR3OBerDzU6WeAoXaKj5NuIQU7tq8FToBesMnKoj04Jc1N0GVZKd+y2
	 pvzlTlnKykfRiCuNNMZU+zZGrrFEVWE/8WQnWt1CwIebJAi8u9oI58FZx0cLVSegJBdsn
	 4RK3orEmH2vV4lZdCm+/WSmUH3iEDx+Wqnx8HxxP6as6brnJnXfVN65+7tLt6lRXPbGBy
	 dmCBAPh88YFW/tzGJr+GYIjGO2G5ONJZwpt9POjJF3REVVe1CEkl6MA2mC6O5jO0+L5HL
	 IgMem1RZ0lWG02o0+gW+VkkrfD24t7m0L8TcihiPeeJNtg/9Crq86oSK8fYGqHxJoMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="BR/xPm9m";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ji7TjIIb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAD1606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:54:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DAD1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BR/xPm9m;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ji7TjIIb
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9maYR4131875
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lTb1A0Hfb5XeXnPFSrjY1zIvAVboe0+YM7ZLM2/CDL0=; b=BR/xPm9mPVuMbuTY
	qHOhoTAFWYOZnL4xNdYviUSRHm/m91Vbe6K2nsuGgkjrmBoFAGfcDsvuTZWCvN+V
	0gOK5xCvXgJqx9/oiJpniMJjQRnEhVUFH4OBScOQF4ZF4xVjoY/5xfp/LPCyiRxt
	nMwE+AYCbNr9xOtFXiN2hyL7lEL2TI85JDN9OpzPto6ID/D/kGYmn8Uwj8bkmmHk
	W2DsICAdW4V5T8uyjiBIdHzdUvQtYRAmrhD33c96XdmRrFwAUa9buggFUibtkiHE
	nBRfI314xJSisFPsyc5mgeJaW1iK9RexHab++KklPsxu/Ebf0uvAN48fNkoIvPmo
	rr+slA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhrq2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:54:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844cb60so993921885a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795607690; x=1796212490; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lTb1A0Hfb5XeXnPFSrjY1zIvAVboe0+YM7ZLM2/CDL0=;
        b=Ji7TjIIbLGS71ae3i5v0WVfWPLdNV3S9ACMgxZmCthke+fuB1wxSs0OIhH1Xzo6AWW
         jwbz7oKRsLhc2/YD/aBHWfebJnsrluTmMurfU1c5Y54aYrRNvOC8kUlCu/BGGBy1xtjX
         t2Da/RH9Y5aidft3NK7U8ezuejjHzfOqrcSh3n6MfTxjS0GfeOUeDky+iXFJIVqH4a3h
         RD/5m7f3fLzlLR9YtL6JSJ5fMtSfEJXG8cZhI/d4fz+8BAsBEjU/WeybHHdDZJl3YJgE
         GzEeBxyLEc8OMB6OG54IN3eLQw1D050cDs10jQg6iSywbRttwANTIMv69tNVBGTZRi1y
         t3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607690; x=1796212490;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lTb1A0Hfb5XeXnPFSrjY1zIvAVboe0+YM7ZLM2/CDL0=;
        b=aV6Y8cu1Qd4NWg/wj+xU3sJLI58xwSbkX+MQy9NVuOw/cR+rIamc2BuwAImZTlEvHT
         u1k5vNnXnuJKSa2ahIS8chD69UHl8SuRhnP20KeJk3lJ3FsBu+EnhEN7Usfnyck3A07r
         LanOJfiHbCq5oABqSpuc0YAjEYG8+fB6q2glnaWZO2HWKYCWhrjRr5kgMCjjK4F+Ag14
         +X6To/wBneyKM9v3bdfyemWjzSy/D8Kk1RRw93yOUekOTqLIanS+cOsIvmxs67v25myZ
         Ti7sy7V32WVC1tL9doGRWTxkfMSKCaNia8k1UoTUOcnmQkaVd/QZbahigPDqntBzXXC0
         v7dA==
X-Gm-Message-State: APuU4Z/G/4PdKSGnAOMF3PKSg9T/AeK7CmxnY0rGFywxrhefBkvSG2O9
	znrhIGVeb/0bUTQt+rPGTdWqqxyAh6J7FCulfonqvqIFOsp6tPF7BVS35T6nbi/Dn5KMSyakW/S
	OYJ9JefUObpH1T0UQEcoE2cXwm4HQuwTpzgIQro8V73IC2gMMhZLbryx2ZwnKZCK1v9xw585xUK
	c=
X-Gm-Gg: AZFdTZeZ5oc1Mw3ulI5oiBLYTn92EihvaKkhLjtfnJxF4F6zQxNHH9bzxJix6jW3Y6Z
	HpvwP1BJEjiQp/nQo6IxKzAael60NhtFNsvoNP4uR81i3pf30lqXV7EZbfFfN7IS+zOL4e8svSy
	vBaCSNNH+hthnTtxt9jWTgOM1NMcRClpuwwr6JVoImEGMDclmiudQE+4mLIh0aPIpWBFi40BSIe
	McIXg/dM1ELrt6xcmTB9H68tyOij1Ilwk2hip4AMsNOrZk11BpoegimCEi93eIv9RGe+w1mIOq5
	oVfL/5FcoR/UcwbH7iMGboiLY39psl8BYfbJf2oMmwZbz4r+uJ0x3A6N/Czjbj6lM6kzC1M6Ztk
	0jvbdMlXr86/kDxzK7MtsK0v4zajdd15plk/S4v+8fyM3Kdcv1GhPtOt62d6JgUEmG5LDGBlDHx
	lm6+v43l6e3towINaFN7DJhxEFz2MqfGFWKgw=
X-Received: by 2002:a05:620a:1a20:b0:944:4e6:85d8 with SMTP id af79cd13be357-949b3402288mr3213981785a.5.1795607690582;
        Wed, 25 Nov 2026 03:54:50 -0800 (PST)
X-Received: by 2002:a05:620a:1a20:b0:944:4e6:85d8 with SMTP id af79cd13be357-949b3402288mr3213979385a.5.1795607690114;
        Wed, 25 Nov 2026 03:54:50 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:ae4e:e70c:bc04:68c3? ([2a05:6e02:1041:c10:ae4e:e70c:bc04:68c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm38679674f8f.24.2026.11.25.03.54.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:54:49 -0800 (PST)
Message-ID: <3c02886d-5c5e-4b62-a671-e469157a5b9d@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 12:54:48 +0100
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
Subject: Re: Missing signoff in the thermal tree
To: Mark Brown <broonie@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
References: <au4SKRePRjYBItxx@sirena.co.uk>
 <56328964-8d06-452a-adf5-ea37fede069e@sirena.org.uk>
 <782a33af-566d-406e-9f4d-52d80cd3c756@sirena.org.uk>
 <70a066cf-533e-45c8-9db7-e79727dc6c44@sirena.org.uk>
 <03320894-97d4-46bc-b11e-5fec18146963@sirena.org.uk>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <03320894-97d4-46bc-b11e-5fec18146963@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b06cc8b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=1LtqeKAUxZIeCVZ3D7kA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: n0DW0qFF1P7NfFtCOAYHDreO0fzwJ507
X-Proofpoint-ORIG-GUID: n0DW0qFF1P7NfFtCOAYHDreO0fzwJ507
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NyBTYWx0ZWRfX9pJ7I525iuwH
 IGhB/7GB+sc53dybONoM4Em79bbY5es0ABEeBKSfN4pxmld/nDE68gD+ZycUkr08mQ3WEDKKB7o
 stAHnVL2b+24skD3xPFBRJzMjb+J/Xg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NyBTYWx0ZWRfX93bTKXTHdEKy
 L+C6UdV9xOnmskfPoBg0MmiZpCZmhJ+J8cz7KRASxapaXjCW8W/ToooHONDbxwczg0ubNbrw00Y
 RzRGtv1fzJi452Y98JoPLRAAGntwLf+qBnWl/OJjAmaOI2UF+9i/hkl+nkYZUU6KOBuCJqv8WNi
 mSToILIZnAK5jeqiTKsHMtkhf1LJzG6GQZh0NDgZ5DZH2T6rk9Rmz5boin0VAgl6R1v9YZSv9z+
 PEnkq8s7W+z18nzwXWES3PrKWs8gV1ml/Kbt998k8lLBIEGFKpZ3sHprVayKvZw6u8+o5bXoFin
 E2EJpLV0P6zgtK8RVD2LeBDVeKQs+5f8U54QKQnGS7mU56fWAacz0F1a2X5hyW95nn54kVAc5Px
 1bsJckAQmncuEubqsq5ihUbt0XQJ7fRWQXCNpTJxDWDpW4nxhYk6VVd3yoOExC2o+7wr1rFCVHR
 HNgo1EGGPR42okYpUcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250047

On 11/23/26 19:22, Mark Brown wrote:
> On Mon, Nov 16, 2026 at 10:18:31PM +0000, Mark Brown wrote:
>> On Mon, Nov 16, 2026 at 10:17:14PM +0000, Mark Brown wrote:
>>> On Mon, Nov 16, 2026 at 09:51:27PM +0000, Mark Brown wrote:
>>>> On Fri, Nov 06, 2026 at 05:45:13PM +0000, Mark Brown wrote:
>>>>> Commit
>>>>>
>>>>>    115b4ff52cd35 ("dt-bindings: timer: renesas,tmu: Add SH7305 support")
>>>>>
>>>>> is missing a Signed-off-by from its committer
>>>>
>>>> This issue is still present today.
>>>
>>> ...and you've not told me about your new email address so you've
>>> probably been missing some of these mails :(
>>
>> Found another address to try.
> 
> This issue is still present today.

Should be fixed now
