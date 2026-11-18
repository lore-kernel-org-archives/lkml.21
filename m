Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011271;
	b=zxhee3v4JvgUTC4lL0QYICaB5ZX7hSpmhDSFGOAxXGBsLhBDWyithks/oQ0yNK3gN/DQ
	 VSUQbLVUXrw4KWhYD9WZ9CyqxWsOFe2n9z6ypR4ADvDOdVq7WQUhXIQf8nvWa1tfirQLv
	 j0rdHNdXdO135HyexYRKvVpAfAJpiXGIYMvrPjqO/0f8mqvxd6ROFz+IHQM1de93fSh0P
	 60UaE34WysXb+BTRZts9zx41NDRNsc/CCXPivJTb872nEZ4gA8TriJMSRQt1Ui94fJF1j
	 fWbQwgHJuy9YLCO1pUIK6Zx0C83olgAGgVrKi/SXqxPjXBpxj543E659sUKz47ms54A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011271;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1Qu1Ojo5jxOyr+2B6xkqhugnW3S4XuYBiVbuObW8sOk=;
	b=EkaSXk9yZWrZcslhEeraaSlgTHNqwnEji2vad/I/pzU0o009ESXSO5ezZIqI0ycHZg9O
	 iACMMwbgokhS5IMxRhi0YECLEO3NrqP/NDnDw9pXL8+J7HvFS2B0jnBQtKP2bbGzdBVsB
	 q2CQUrrf7pJWY2rX0fbW0YXcwtcVRFSGZopcLPiVOCLZPHcs08TdJ51vlp+IqCZGv5M9s
	 MOdIfevkGkOV04RGCEmNtA/H9gVnhd7vssPKvlY1CKXliS1eNIWZS5L95lPGsiSalZHBf
	 Bi+D12OeMzhzpMXYr1v4xE2L6q0RoYmeG4gJ48SmVM5CoAQt9RBUH3VQ9w210fL20KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PyeF9kPR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ef/RDZBT";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05E9606A33E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B05E9606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PyeF9kPR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ef/RDZBT
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDQOxi1928674
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Qu1Ojo5jxOyr+2B6xkqhugnW3S4XuYBiVbuObW8sOk=; b=PyeF9kPRokm4hd0a
	yL9/xm8wqeuvHgfZhFeorssTrGMnBrUiV8ryEioZ89gPk/n1s8lGO2sb0zlqDCSl
	S0JLTQRuf0C3Y0Ti2mgFT0wHhfnsEtTjZ7q0dJcLsK0VM0wWtQY03TxHlsOkuDhp
	Mzu6H4GqLqT15+ZpynA3z/5lgqWRs4Yaxv2nakClqa7qvJp4xEZi/3Y2hLbQNSad
	xtkXCGvnof0YJu22dgSD/HpkyjP7fwQZWcdzdi+GEbHRuaWzC11F7euLgA5MFjZH
	zHPaIj5ZRh1Zjmh8+cpdnzHDHfmkNIIYhlqTGtipMGEocKk8Ln//GmcGTcWOhUHQ
	6MeWUw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8bayb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:14:29 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed08904845so13258085ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795011268; x=1795616068; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Qu1Ojo5jxOyr+2B6xkqhugnW3S4XuYBiVbuObW8sOk=;
        b=ef/RDZBTD7uE9VSfwclXF84QQ6NwY4SOA7BRNNlurDUJISaa1sjVOgWpg+7zUXrK3A
         A0wt/wIbo/Tug0i5woezdithZb4Z6sg3bPNRMIrVPSdIQs97GVD6latloUpRi4TBv+0C
         B8+u4f/16LdLJdaBy/B70ihvOV7Okq13i9zH4/MgdrTrwOZ61FEDtjO9fK6EJTYcWBhd
         f51lIgpfKeBxahgwcvIazXirXrtCFN+9cD+sgeVBWPbcU86zUAbYZJPbjcHq205wvKcQ
         KCqwj/tlC+BzX6cTfLr5ugrIFo8zjTpixWDhBM+NMtcyRgCA+Yhp7QWWchFH5wYEHRG5
         t2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795011268; x=1795616068;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Qu1Ojo5jxOyr+2B6xkqhugnW3S4XuYBiVbuObW8sOk=;
        b=KBhzZkzh7LK5S0XmieQDk/VrvpJEbUIK/7apmyNdlv2dGqq6fnNEfe8L215yfrKhbL
         0xBKpOulaz6JclynX8BWtCfW0xwwAInHthwMSSGJDOBOUuaYJwS4QDRJOqspnlS0BqfJ
         4dNW29fhSxzTNTnAMpXDljsj3bhvuklDe0taRT4At0YsjvtNAmIXqSr+9qIedlSxN3at
         j6hSOMN1dPpbQwC4N3gDjjnHRxp7663C2B89d/G4soXIi05UJwY2LNObaHvl7/UFfclm
         yY2ksQ2a2pVkwzFhLHhWwOF8foK+00xuxkWkyerbq8V+fSvWXndemWO5Bwg0CcZPeHgj
         UpMw==
X-Forwarded-Encrypted: i=1; AL+hErF54IpS8ILLOGjq48ui2U3Mp2AVoDGEOY+jkk+JY3B3oVRqOaMLaa0aaJi1cE9Jwk0iVHALNaK3Tcnnirk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/74jp3rSJajWYd/7lWTYhvPDQO4dDkIgbxa8CLz6KNmVzOenyX
	Kr+KKTg8Vy4QCh7Iu2SDo2lRL5V/DpOgrKaiigLL24x9xsf/Bvom5OxYBubIjO+t4nvE/HXQ7Vc
	OgvXa2TtZiibxoUWtPrPcUUrvxcNnz7l5Ga0Cuong6NsX/klVdGrPFtVKvMNwcjpPlQ==
X-Gm-Gg: AZFdTZeV8DAxWxXM4edGoyoRyCUD0kFfOdo4Lc1y3R35lgmYgxb/D5oTMKfLmUcGWmc
	ADMqhBQHDU7FLjpu8XZFV8i8saCmCHrpPytax/wueTs8KcxOfvRTVtxRg+fPzzvuayquetGCCxi
	wVkwalVbTvkl56Jy5mcg9mDufepAMQrk4mu9VpCcBedTAyYoATunbiMSw4AEFCmGHDTHGff2Er1
	z7LAz4krwr+JSwAqVXJzQMsy+6xBdN1G4iuGBGZzRGyu6HDKPx33LPee6Bu/eT5OQd5NDnbuXYq
	RBQOPlKEHU5Vg+7cE/lwdCs4Pf6DAhUOkmIovPS8UNcBR/WtRjXFEui2d28J3zOmLETjHU+NTgh
	Z1kzvsQipvVm3d9kWLLZ+MPP2QZMS7XcpiVUounDm1DNNWkgf9Mgr+8pVtpTbuPfCtfLcJj7BnU
	O05ied
X-Received: by 2002:a17:902:db02:b0:2ef:dc24:c71f with SMTP id d9443c01a7336-2eff754bf1bmr27413645ad.56.1795011268353;
        Wed, 18 Nov 2026 06:14:28 -0800 (PST)
X-Received: by 2002:a17:902:db02:b0:2ef:dc24:c71f with SMTP id d9443c01a7336-2eff754bf1bmr27413405ad.56.1795011267851;
        Wed, 18 Nov 2026 06:14:27 -0800 (PST)
Received: from [192.168.0.104] ([49.206.14.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6215025sm14313315ad.46.2026.11.18.06.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 06:14:27 -0800 (PST)
Message-ID: <4dd84a48-2728-4120-8d08-363666323bce@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 19:44:24 +0530
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
Subject: Re: [PATCH wireless-next v4 09/21] wifi: nl80211/cfg80211: add
 support for SMD context programming
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
 <20261106-smd-v4-9-62e39487f51a@oss.qualcomm.com>
 <7e6a6640fe034af160eec0dda532259b499153ad.camel@sipsolutions.net>
 <2be101bb-081c-4d6b-93b6-a7cea3f183f2@oss.qualcomm.com>
 <0ebac9768c0294b8ecfc8729447dee94ec0b7c84.camel@sipsolutions.net>
Content-Language: en-US
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
In-Reply-To: <0ebac9768c0294b8ecfc8729447dee94ec0b7c84.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4cDTPNuowkKsYr2ULd6Xee5oQJf6haMt
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afdb2c5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=S4TnAKnbd+bQPtf57r7XhQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=ax4AIyTa-rlpZmfnBJkA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1NiBTYWx0ZWRfXxa5Wk45yIudb
 g82kVyDesU38JFw9Qb1DgnfHxsHYUrcOSSXwBrLjRwcWnqX8qd0ms6xMIx0CnSEDfY8j2PVMN2L
 4tbMyQJ8OLFNjDQMHGebXwlYcKVCZAEcTeSfr8xzzclHv2Cj+6TXeZCRlkGVw5OMEIaE0O4zeVx
 eoCASZzhErKdV0yJfIWw/dzfbNPQlKEGzhq93nUx4xImLJrT73guCqosa47VxUZPU4hmaUrIF0h
 YyjtzUgOTqWZ/K5hb4abplqxRIT17iO7LJIaVPhDTpyjmmdvu0wEdoy7sYPjNuUzbMBQFZIiVIA
 AUipNgTl0OgQ6VIrsAvFZULATNws8/sjc3wBBG4nWF4Pdthz9Xg6Fh9Nzlb7vffhMXezk8eNkAO
 3tkwueKa7L2SCztqkCE9ElebqWrgfTutbYeCK/xvn/9reDswgPUdJejkVfwuGgxj/VgXD7o1a0L
 6jWqweG20LJdJbEqxFA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1NiBTYWx0ZWRfX477W5ceZmtTd
 81C3QEVykG4qbz0/NbqpW8EcQZx0VamT4ouzZEDJhXvXapapJet2/kw59IRCQu9VKS6s/es/WHo
 5LZU0/rnWBqIOmnt5BjGSy1JqNUz7+8=
X-Proofpoint-GUID: 4cDTPNuowkKsYr2ULd6Xee5oQJf6haMt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180056



On 11/16/2026 04:43 pm, Johannes Berg wrote:
> On Fri, 2026-11-13 at 23:24 +0530, Pooventhiran G wrote:
>>
>> There were similar changes done for array of values for
>> NL80211_ATTR_CNTDWN_OFFS_BEACON, NL80211_ATTR_SCAN_FREQUENCIES, etc., So, this
>> approach was done here to make sure that each SN in the array was u16 as
>> expected. If there _is_ a way to add policies for the iterator-based nesting
>> of such values that you could point me to, I will change accordingly.
>>
>> [1] =>
>>
>> struct nla_policy sn_policy[8] = {
>> 	[0] = { .type = NLA_U16 },
>> 	[1] = { .type = NLA_U16 },
>> 	...
>> 	[7] = { .type = NLA_U16 },
>> }
>>
> 
> Wait, I thought you _had_ a policy for this? Sorry! I also thought we
> had a macro for such policies, but ... I guess not?
> 
> There's a preference for using a single attribute multiple times to get
> an array, in part for this reason, but we've never done that really in
> nl80211. Maybe see how that'd be?
> 

Sure, I will try that way (one point is that doing so will require an explicit
TID attribute that I would add to the context attribute space).

> johannes

