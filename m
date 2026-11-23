Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795460793;
	b=pRNpVwyHecvxay1aK9mum7u0nJ+uLsOrs0t7k9hBLTl+lrHr6gakEBDlupmnfb6P0k8V
	 7mjTtwqyC4lHGxqj0+1ZL+LsfkZsQqdQtjHQZPCSl+/x9wz3xbDaTt86EPafV+4litX1R
	 0wSw4LWSe2MDLK4Bj+hUsryhudoSEJ9U92+U2v4TJmJtJXhwFLHXnMEcCJaqHzNL/KBLF
	 DtGBlso46de5EL483iF9J0LCVLTAgdKdBsXzp8UD5oTBjFkseC84thareYQ5sN9sPjndK
	 54o6CxdhSsLyvfEFB7yEzJ413TI8oRMHUjMpmS9+1XO+YKu6SBmp3YKZN+DXzuxMMvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795460793;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tOiEwd6kmNV7JIBwmJP7LBiUslyemiGc6RTx8IgEqZg=;
	b=oalufd1GA/54adwdxWVDxc3RVCT1hZkntDVkeGBXHFydVSAV2qAfgwjzIPLHA3X+Njwi
	 +ZnGQSr1mnRptLtGF2sl5IXsI5M0hpvdiaLpg2oPx8X8ku1TGF7FBXEuJQ68lfTwf5sE5
	 7aWXJbnZ5cyt3h/FQ1j65cVCtTlvTrDXwgntjmJBfSD1Q7INrPWI7sC+um4NTvX/5zqJZ
	 TOPu2js0H3eUW8jN8yL8aCNHAXrj/5dL0nIeNp56oMtejbtZFY0+oFY79ea3GgULrNt4j
	 Ja3RQJ+ZLUm9n3j9MtUQ59RzeDYxNPbHestYeH1/izD0bOzTpVuiyJ3vdpEMSheq5oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V2Ndm5ps;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jlsspv7T;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C64606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0C64606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V2Ndm5ps;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jlsspv7T
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGtOu2340269
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tOiEwd6kmNV7JIBwmJP7LBiUslyemiGc6RTx8IgEqZg=; b=V2Ndm5pst2LttLdd
	m2l7dKji3WsB65MiKKrgjJi5XWBNT1IORbR5UcCrn8c8eDP4lw5+ToHAWveqUXy0
	923iq++6EIIRIFA7wcpqYjkGsJCqT7TDW/HLA9qUqCIOrJ49uwZN2FVju96mb+rL
	AIXjyZkyxLZFvWP/kXHZtesVtPfPKmATb0wtix74YW7lemI4ofh9QDVg6wxtSat8
	nop23RGxiP97gPh4l1nT8aO77dXsEFrSgThlUo4HXyulqXZAsjokaPaunJQo6FQj
	53phjBBd2Pz84kVSK+Mic7LBnAE/wrPw6GkxilHkjjnVqTYPjeVzm7aOhoiqBwWP
	npA7YQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx3758-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:06:31 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ecdc7807f4so135898e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795460790; x=1796065590; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tOiEwd6kmNV7JIBwmJP7LBiUslyemiGc6RTx8IgEqZg=;
        b=jlsspv7T/rnV6gJHWwM2AYbxAGAwKfPeYhFnWXxWXdATDKtm9HUgg6QkLNjMf5s31v
         Tv9HE8Ier3lqfhUSA9LJHyDjRNtHhtADMuAHhntVMEOzplIoLh6lYjVcnEoS4mnKSV5b
         mjQ6Sda403fd86OhqclG406qP3J9WsCkDLtuqs8Wsz4rU6x4Yst7QmVghALlzRapTWn4
         xIzI/zMxMp1P8YnZZFK2A9KZg0VdHrz+U0PqdvXgyjU+luoji0vsz152H91Pi+ba3nrV
         GLSLZlCW5S1VGz3iQLfVItw5q+0TbAeipCOj/rhpiyd0c2kWmubspMgWb558y314RAk+
         nShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795460790; x=1796065590;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tOiEwd6kmNV7JIBwmJP7LBiUslyemiGc6RTx8IgEqZg=;
        b=AOu0fDhOvHGNVXhDr8C3gL2tFbQ6SBHoczM3HXz4lIXxCmlaCEhHNPKymF6ceitlLo
         +IiOmhy7XDEwa9j0n9skTpbsxP6Xwyy56ApgDat3IepD/aW5Lak654/Bdu11vYUkurCd
         BbHHmh8G1Lk3fe7QWmVbOjEhwy5IjjlzTYwqW+qTg+9Yb7f7O7WmVPgVCY206B+n9Oq2
         F3MnWgaQFx0Q7iSKeEISIHH5MQFUCFd60KTg4OpZP+9Z7TJzml3d0pW3603ZE8Si9CkW
         hyKeuSVSiM745iLNSjVivPbHMoJmSxcbVXoxUpaX5GQ1eEWLoFSPIOuMjXZVhxNrgzoy
         Td4Q==
X-Gm-Message-State: APuU4Z8Q7BLDuTPWpHvPKO92aH04glqYBxgC4Jt9IQb/4CxCLvCplJ9t
	bHExiQLa1E+sH6aOHOhezgwBc6QA4HGu4jv/XnTEXYY/xam1p2wAFH7k4iTsoijfguxouYmzepB
	3Gktl9OMEuf5kDwxjji0dHN7gNiRL3zreMx7ACBt5/AR9ae2N8+kcZqWSoKYfEhesa5EhllzOh6
	M=
X-Gm-Gg: AZFdTZeIdnc2+Ag6YmTwacuiQ7iqWIP64A5+BCQgT+a1Limb46Ydql8hmY2lqOFe7SX
	1IqSTcX/luQ7/aYJKZYA/kPjFwQDT8j1v5Mr6YNLdFHJV3nsugx1Txg8fieHpp0cRhwfR6HwZTa
	pWpTurFvkZyX2MzSQ9NcSw6FCBTPsgfppBP+WCQWPURH4PDSlvBt7URDnieBzHDZk6uugORYB/a
	HoZV56S9loK64c5i34SDRkEmnB4MVjN+GOBSpx03Ewmn8UWyfTtIGLYLEgUd2yRhrVKrG2h4dQN
	nNDEpOvRc1L51fIG61yRmW1w2FQZMMxNAheBDga3UyepTMvjEppUbN+YmLd5ev/ScJaGU14YjKi
	2zAqGrqQ3YsNnlPYnXSdJQ5dGAvVSZCn9rb+TzBUXvrhO7lO04DUQgNSsupRCUqnC7K1MhrU=
X-Received: by 2002:a05:6122:4805:b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ee8af179f3mr7041962e0c.3.1795460790225;
        Mon, 23 Nov 2026 11:06:30 -0800 (PST)
X-Received: by 2002:a05:6122:4805:b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ee8af179f3mr7041913e0c.3.1795460789779;
        Mon, 23 Nov 2026 11:06:29 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba854bed08sm3651400a12.30.2026.11.23.11.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 11:06:29 -0800 (PST)
Message-ID: <786351d0-c7a6-4ebe-bae3-0c81ec20b833@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 20:06:26 +0100
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
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
 <20261122-qcom-socinfo-id-dt-bindings-v1-2-eeee0ffa25da@oss.qualcomm.com>
 <c4509c17-2c67-4f76-899d-548edc47069c@oss.qualcomm.com>
 <b10fa9da-39e1-4bfe-8c09-cc1d5cc007f4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b10fa9da-39e1-4bfe-8c09-cc1d5cc007f4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b048eb7 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=09P9ZdklQj12kDAbNyMA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: pIM7g57ixg8cCAzfDK8Y8x1mBfeO4WaW
X-Proofpoint-GUID: pIM7g57ixg8cCAzfDK8Y8x1mBfeO4WaW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfX/bhO/gC54NWU
 vnX0N4wS7zk1UBikQBasKnHYLRcggD7Wiv6EmMXN4EWfmkdTrChpP1Pm+zk3pzPnQOzY7UIsMcn
 h+/kSe2uW4a+i7NxgE9gDtLWmbReql8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfX8rYicH0UD9Gw
 bTDm37x3kor867Mm/8Nlj2qhM573fiYGJ4bnqtRGu8RsukJoHyuO6/3vS2EIn7uK+QR/l8T86P+
 ylwdE974Un4BTCI7V8gAxgGpvg0X24btcmFiVWtEgscx/qdi0kKPUJLXoLazGlNo7XOQgeEyJpB
 6I/x3H+52Y6eWAjf2fwPszaWbHUkvm4hIIaeIb9ZjDpRhSrUfZ6Ntd/cqWZ1uCOPY35pzAUAA42
 Vp7mXYKWLqbQfLpCzlv3IYV50rTSONlR2lNxucY4bzaQsixW/4PliaMas3+hBrAkZ4uxoTZZeGN
 iD+RJd//9xyC/l2kIOyEEbR+X36IOXKKTQ4rP4gQIzJB+k21YXegU4MkHD63ZkO3qub5VvcdHaT
 /diC/EShpjRTNnIrMBZBzwtLBlgxpYo5dq494wtPqFzYP3L0nkMr9VWSEKAFA/cxfbqpYBYjJy/
 5L8vlrXtLOGF0E48pdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230076

On 11/23/26 4:22 PM, Krzysztof Kozlowski wrote:
> On 23/11/2026 16:17, Konrad Dybcio wrote:
>> On 11/22/26 6:46 PM, Krzysztof Kozlowski wrote:
>>> The IDs of newer Qualcomm SoCs, as reported by hardware or firmware, are
>>> currently used only in the socinfo.c driver.  There should no and there
>>> is no in-tree DTS user of these, so none of these constants are really
>>> proper Devicetree ABI.  IDs of older SoCs were being used in DTS, thus
>>> that part matches the concept behind DT bindings.
>>>
>>> Driver have local copy of these defines, thus these can be dropped.
>>> This has no impact on in-tree ABI, but any outside users would be
>>> affected.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>> ---
>>
>> I think we can move it altogether, to prevent a situation where one has
> 
> We cannot move all, because some are actual ABI. I could try to leave
> these ones only, but that's a bit too much work, IMO, that's why I cut
> everything at ~450 value of ID.

If you mean ABI as in "used in DTS", I don't think that's quite ABI
(again, looking at the glymur-ipcc.h case)

Konrad
