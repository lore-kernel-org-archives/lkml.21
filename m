Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471539;
	b=V/DKJgTrNGcazclGR2zlbCVe/2D7Ci1cBvKV20Oc3LLax1AkQAZyv7pwXPesOPfKbApJ
	 V1H6M4ElYqxQguonnvLZFB9EifV1Jy8UPBL9KBcj5phVl8miSY9xYohewU/GCOAS4t35J
	 M+xVz+D6CreAYe94Ny6U2aE5EETfu/BZd98d2dJrXhCKKmfHP8p213nMvdjHnGUWq/+Bu
	 ly5xU2WaHneyvvmjzbig9TsqLnHf2SisQnxIGxXwqG1dV0qHxuyvdcm9SoYjMZhQWFqXw
	 Er8N1Bfhat/gFRHkwBWQyDAqq1Zi1xpcn0aMUr/6eas9rNKBYuDkpx1Bhbm6t8vWd2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471539;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6Hwgz6UJp1yMR/zqjsLjAqDsdzMF2c0K1/Hbqb7QejY=;
	b=qbiSBQ0Niq7qcCz1PZJwouYOkGlrR4RC3+pw5EWXHpiij2PFbSovT0qJnR6/Mk2Ux9zQ
	 GRyKKRd8jUOh8o83++U23lDkXqiOrE2DJ3wt4LdGTeF9MjBSZuYHjpy+Jzhn1nA9tw9r1
	 Df4Jl1gr5oSaA98qWMMsvJXjpiyP91hjA9KmraYd8FKxpGffgSO/8jth0xE7P5QjovnwY
	 pW9PioZmwciPNoOadsyLY5Rz53r9A3sxgIbRlIKHIQRoDc4Gt0dwQAOZiEI40s6HnFmQk
	 52CA527w8Tpe+FEfQdiixJKf6R8/CbKaMn/nYuwvOsLKEalT0k0Eu6Q/ytUL0IOmjdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="oMYk/6eC";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FfIHwB8e;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDDE606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:05:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EDDE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oMYk/6eC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FfIHwB8e
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuhol3962814
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Hwgz6UJp1yMR/zqjsLjAqDsdzMF2c0K1/Hbqb7QejY=; b=oMYk/6eCMHBpz52z
	pxjsUACx/yjdyR5Na3Y8lgC9d6C3rzIA3YPT+aq9bMLsCAaO2xsqUrCU72fK2Rpq
	ravGaf4kufhebKk+JywQbnhuzTodAk2WlM7uU0zo+pMG8nwpgONl/GZ936HeTWLD
	FXrxffHXbElvhoolh3X96ZOBorOZZNKD/vRx4eNmebmgR1MacomARN4CBT54ifi/
	7arjReUqUf+Jj9lQrS162Y/uq1Z9rbOrx13yEww+aNIguPai4M5UZ3WEdPLR6H1k
	upjPHIW0VuVeysy7hevmkjzZe51l4g8uvrtc/O9Qqt6yZJY6OP09JE2mBEVPnlbe
	zMAaIw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7uakk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:05:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9495a1f5e47so627464985a.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795471537; x=1796076337; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Hwgz6UJp1yMR/zqjsLjAqDsdzMF2c0K1/Hbqb7QejY=;
        b=FfIHwB8eC45XW3nJK8rlR2hRjhfNi14xddoPI6f/Mdmcgp4CZ3zxepPn2/dEwquhUV
         plXJ9BTg4OjMDdNRAMGnTT3mqt+8cYblwgRVX/973o+8PlbPLgsWUwKS1TZUxMw8n2eD
         cNIKUTjNbzFgbfJpXhhahSSuW1P37Oguce0ZQoQp70RZQyG34kp7yjE8VErTLSho4diW
         rq9uenBaFSyL577DNgOCHdsBtyxKsTUeUdgLzYB88gh142IgCdM3LaM6NH0sAa7zIhFs
         gav1q4OxCvOeixqEX/YBmyNe3R4Tw28reWulRy61IDjZ2rvwpB+FQGPqizqUyVt8Gkoq
         L6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795471537; x=1796076337;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Hwgz6UJp1yMR/zqjsLjAqDsdzMF2c0K1/Hbqb7QejY=;
        b=DQrIBi78pb+FAcqFjC5oPLGZ6bD1SJYvVoLSUQj23c164qP6DfdMpWHEHYApfXousT
         Bo/NuK1flkKUavhfwyHsVu2XPI5iwajKUJMyE/WAIvyGIEJy9HmqNbbVSS/ee+IWgW0+
         upcAQeg70K5KhQLbgJVThBQhphZ6bjmUaNmYXW4H7I/vqDVp9teHZYYw87unfCP5dLil
         ZUZ+n1t+TXsZ30lwen/16hUYxBWsHMBLTymNjQkyIcuo/k36uyRWCveLSbCSAKGQuSHm
         XSwlhuIzrrArn189GG7espama3NU7guJvtvPZRaboUpqfQyg9Mw1/YP3rUntY7Qm5uya
         9JQg==
X-Forwarded-Encrypted: i=1; AL+hErHxKh6ZYj2E3CeBxYU2DWIh1HkP5rBWhuu6Ft5XvdLb3HZ0O5AIEuM/bfL8eDi7qYHTl+SLUlPlgjvfvJY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nnXfl9N18MHH8KEYJPpQDcp9Iy4t5Bjm7ziw7zxGaDshZDetx
	fyoUABikJDGl6RBz59Ay4Fsbm1Rtzsnm+hCV9JnMk1nzzV8rDbdgD3mnXxoYAsNM0iZXAtTXwEX
	iUmvDZMEigcmlvoiSJL8Yc1NMlB+ZoP2xQtVkav7BsyGuYcbCudGIM8dbvvIf4HOt4rc=
X-Gm-Gg: AZFdTZfCojlWTs/JXGfjdqhchpZG8AA0T7ikfP6BLYlFbxzdBo0BcV14zmS/kP972nP
	JCbcHOjE1+xdJwf5+iW4XlbbFTeyNFPo7vtUWma9jowRC18VFv5wOI4naBDrFv929/Ce82SFRzg
	kWock9e+Virwd0988R+S7X7zO7IdO8Nh3bOmXg8Obl4cWbKjtZ4WhL+JX2fVfUxS44EjFZQZZpa
	7AbcE2NxX3VFG6bunrjiiYTXZvwmJZOMjoQTZg9rlaZbay29EpqVa853HNaDZ7zUiQQ0o9u68Cd
	RjgFYi+3tFVIN6JVHhHkLe9BASfiFWcqZhb+x84O8XaVPEuzuYmVZpEQnZmOGpZhBmeashZZRY+
	0S+cNLot1CdSPKXYs1/UhyBgPhwrLlJYdR1ZuaagIClneoTabD6GXjv96k90YUHtEIMDTWCrXRp
	8=
X-Received: by 2002:a05:620a:4495:b0:944:dbd:8253 with SMTP id af79cd13be357-949baa03d05mr2138288785a.59.1795471537412;
        Mon, 23 Nov 2026 14:05:37 -0800 (PST)
X-Received: by 2002:a05:620a:4495:b0:944:dbd:8253 with SMTP id af79cd13be357-949baa03d05mr2138282885a.59.1795471536895;
        Mon, 23 Nov 2026 14:05:36 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm708892455e9.4.2026.11.23.14.05.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 14:05:35 -0800 (PST)
Message-ID: <b1c75c62-1b44-4ab4-8bc5-688762bcb8f9@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 23:05:33 +0100
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
Subject: Re: [PATCH 2/2] dt-bindings: qcom: qcom,ids: Remove unneeded ID
 constants
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
 <20261122-qcom-socinfo-id-dt-bindings-v1-2-eeee0ffa25da@oss.qualcomm.com>
 <awRA_lWAviFJj7oC@QCOM-aGQu4IUr3Y>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <awRA_lWAviFJj7oC@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b04b8b2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=c-T1lRSgfK_BPOqrbiAA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4NyBTYWx0ZWRfX7kLYnRFDOsW4
 m7OsLO+3iXJD006H3XG23iNPSWGdm00DMSjO9JuFJYzRqOJsDpobfJaXzOjAAu9Vbe8K1I3vZDT
 ppnWO4e4ZIE9XQma5/CowCy1YHcEtD4RayUytwhR5c6JfvM6wR0U1y0v1wmSuHd6tXsPvsR67BG
 u7ZrTFd8zY2ICSXs+Hc1c1Rd3lvGkpfO1c7T1ra4dx1cOPqAJg7BwT6q4O/FolmV0FXDaWryZUB
 H3UENL8oP18fLXZqi2pKb5rayZedZ4KIQ/rCDKD3xgP5MA586wB+oe6raPy6erXSbTQrtIf6QqZ
 u/G5xAyhtWx72Wr25opm/JEnupnaacTb17mj8mZ+VkXJZm1zYgnQhjgGrS8srg30i+S33uKDagq
 9Si5AAgg1lXOWZbufT05dfS5SiigQ+64YCKhiOAAFEI455L7sDFYWqjAMqLH2skOHKYVecOVDB2
 u6hYRNq/BI4fpVQxWiQ==
X-Proofpoint-GUID: E9PcKsTb70ery0473XzButDOTOGA0mVR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4NyBTYWx0ZWRfX6gEwX+7O730X
 WR2+Pnvwh5D0E5V4cO7F1Wg6NiK3BOI7l40IIgl4F7j57/Y8XXrP7dArgUB61rWjE7MqTfra29J
 zwntyQVSfl1sEB9m17fkRgB9ydMaBvg=
X-Proofpoint-ORIG-GUID: E9PcKsTb70ery0473XzButDOTOGA0mVR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230087

On 23/11/2026 14:34, Shawn Guo wrote:
> On Sun, Nov 22, 2026 at 06:46:21PM +0100, Krzysztof Kozlowski wrote:
>> The IDs of newer Qualcomm SoCs, as reported by hardware or firmware, are
>> currently used only in the socinfo.c driver.  There should no and there
> 
> Same typo as in patch 1.
> 
>> is no in-tree DTS user of these, so none of these constants are really
>> proper Devicetree ABI.  IDs of older SoCs were being used in DTS, thus
>> that part matches the concept behind DT bindings.
>>
>> Driver have local copy of these defines, thus these can be dropped.
> 
> Nit: Drivers have local copies ...
> 

Thanks

Best regards,
Krzysztof
