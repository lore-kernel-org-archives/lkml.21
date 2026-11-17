Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794955175;
	b=UgacCJ9kku5om2QOfubbUobzIZkCJBHjBn3QYp217zoBftHYGZRfsYqfaOKBu8SE2/GS
	 kKHa6QlTZppl9GmOSS6NvQzJx+q3CoVLa42+dwBEfbmDW5EOfBkvdbV/twH7PG2VkHJKl
	 k5qdOlztPMwn7Fu+WMDzSH+dsiEnCm/HdMTgstQwRPNQI2M+JgMLkdHgj1/m6t6rzomeN
	 OMg06X6S69dEjo1OEpTuAQn0SMO1fhSkGrz77rl5xaOfbl1hEQoP4Sg+U8UokzNZXHXW6
	 P0NI+KxICK2VWp4v4kGXNtSGnWw+kRNOdYj56E7bZJaGbMqRE6JobAwMk+XoYq522kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794955175;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oeJdmVSOtPrls9VV3hInHlrjkBSr2SzdJK8EBsZwZn8=;
	b=E8zHgheZXVo7crSjCmIZnbVvD0ovfvOnCeKOtFidmYjJFQFnKOsrWQSMjNJxAKO02QV0
	 AkDM4g6F63suynze7jAVDsF2LF3uKlRaLHT9nHQrW/jY6gQ2UUpnAVOxKIDrxUi9/58/w
	 1tbFksXnHEGgkbzsO3lNMV5Zl4KDhACQrdo97TLstNjWtcORL1ik+AO7D5CRBAHpSfdlL
	 f7rwm2y3j3CJ0O8ywcsQkH7s9MkhS/DnvUJmgdfwNjbzftiMs0+pgOeRlMsBrH1mIQi9q
	 XQrIIivakrC04kkhpoY8C7je5mRlX7F1f7UqATDnZzvtVF1wUxZBhq0LITIUUuFlZhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hDZm8brf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CISCt4xQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504C4606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:39:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 504C4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hDZm8brf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CISCt4xQ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHMbZts3551719
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oeJdmVSOtPrls9VV3hInHlrj
	kBSr2SzdJK8EBsZwZn8=; b=hDZm8brfDki6OyFVnujj6+gLwSIeefkKkAA1cBmD
	93fGL5ZAKYRFPNU+QH2yajp3262YCH/oEiWsqvY1WdthUf/kplNWgXR98cuU21DG
	0GW4HwR/7OjrXkGPi4/UxQe1fZmVvMazN5IZIng5UskLw6oB6CSd7LjdIL/Wy+r3
	BK+Ajy0P5zBBDTo3jaMappEPOx037W4KIVHtwYSFH7kQ6s0WOSEWGICfbaTL1JiR
	oRe2biZxnMES52uAyIcRSFqFwXOkUFUtZtj8r5r6L5hJhEjcHgXN10uWuGw0LZct
	61e8kmiTLF6Qe4sj4cUQkbRiWwlSeAhuCLd+zWyaMD8WKg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvcg0ex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:39:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-38131260a5dso1143182eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794955173; x=1795559973; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oeJdmVSOtPrls9VV3hInHlrjkBSr2SzdJK8EBsZwZn8=;
        b=CISCt4xQItg1K09O/FN9MwRtG0D25kU4a1V9S99Dp5ddKzBwvaza3W8kDue4NzNRgB
         jMkSubulC5PzOryheK0ePBQTUCCpSV49OxEv1dNJtxwkQSzLzf+W6Hn0NGp8vtwowV17
         IIMxUQ2ccFMGr9gE3WhvUlKrwgfjFiJi3D98pdMeG56lKp9Pf2lRy3Ewt2sVhf0RFdNF
         VJI7wZaW/rpNSrKWPlKXIHN7tbfTFGpV1V2L/mFBXenKGxM6tUGp7i3PB9N9CERuF+ka
         8wqTvhjyqvp7BFsUH/FX4T1Gem1f3il5E9FwGRXhb+5pQhESOdQXSij6l2nflDYY0U5Z
         +K2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794955173; x=1795559973;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oeJdmVSOtPrls9VV3hInHlrjkBSr2SzdJK8EBsZwZn8=;
        b=ZiV9kJdQTOZebbWk58rHBlECzYCP5B7VfOEpDa4KJvUj9cOqheV8hlfZIGHfoG0J+x
         X6K2oDNy/TfvZP+DO2yYPEL6CwQBjI3F3tE55JkFtY2+ZSix4pCiOUuK2Y0DBLIyfjcg
         1EL+nakGTX2lr7zMAcHqcSGtYvMkt82XNiJSRkTBUFAgA/GPcZ56GmA7qVD12OwZVRgi
         k569EFEUCeQMFcaBLWfgkrU6ap9YQOiozYwMkH//3uNl9y/oj3YUSVU/pRV2cyufLYi0
         v+7uJAVkkpBgwmNKb620nSNuILDwqjnP+NZuoJQ5Fv7v95Gg4gtQrvlO2IYDhC16w8LW
         wCZA==
X-Forwarded-Encrypted: i=1; AL+hErHdwEeKYyfg+KvJ5py+8+u4URB92GjT//8IqEpSyldHFyGXMcuWK7LtZKf/e9cJrCV2hMq45Zh4jbU/6Ik=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TdHuAROIaTp+n1sBt5Qf0MfMaf32g/ObcClJUJHwrudyw7/ol
	FAtTFVKkD6ULjKcvWiKgL3HJWmH4fSq7vQOTkRUOc7tZRA3teKFndeOcFPnjWALTjPdVoEIXRWm
	YffmfnXP7dFhzJoQG4CVK5kZkz9AtrXS6B86VgfQiu9MVGIHTdABDKl5YmqPjRvtqVxw=
X-Gm-Gg: AYBFou0GMN5r+inlNFvEROoHPClDPM5FhW344GSmx866noUIw+MAaK0diLubwkT5WdK
	MxhqlmN1+g4YJ4ZOwVJwDZS/KbjbXfhqbZv5Hbr6mXIKbF1OMUqT4Xi/D66VfVBLAdVmIFWDiTW
	hwFzIsQreOryj1rBIxt3SvN4VZVVbd77jNghlRDess+0jg7Zgy2gHbzTY40yMfa4UX46EWWWpta
	wfKgz9Gb2czBJos3JmD30A/x6XWvw2BJ8C88xtHQhJczGu4658Z79EKgpbOM4PUO77bHSCMN7Mq
	i6o5IwuJzrmS+9WTc/dYz/KB4v3oMargQ9VD7KygrOpfG4lGHs4uIX6A7At/nwuIjaNnsVwrvGr
	gg1p7YjCeZE4M/0bfV3Ndak53qMEYbXc0U++uBXY6GHd1z2HOS82sR874jgT3OjAdpK117Q27GY
	e6yHPrD7DKOezT8Cmf1DoXLg==
X-Received: by 2002:a05:701a:cc93:10b0:166:862b:9bcc with SMTP id a92af1059eb24-1b543cffed0mr906196c88.18.1794955172995;
        Tue, 17 Nov 2026 14:39:32 -0800 (PST)
X-Received: by 2002:a05:701a:cc93:10b0:166:862b:9bcc with SMTP id a92af1059eb24-1b543cffed0mr906172c88.18.1794955172419;
        Tue, 17 Nov 2026 14:39:32 -0800 (PST)
Received: from hu-ashoraj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447811efsm1203653c88.3.2026.11.17.14.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:39:31 -0800 (PST)
Date: Tue, 17 Nov 2026 14:39:30 -0800
From: Ashok Raj <ashok.raj@oss.qualcomm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>,
        Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Jinjie Ruan <ruanjinjie@huawei.com>, Liaochang <liaochang1@huawei.com>,
        Radu Rendec <radu@rendec.net>,
        Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
        Sathvika Vasireddy <sathvika.vasireddy@oss.qualcomm.com>,
        Ashok Raj <ashoraj@qti.qualcomm.com>,
        Ashok Raj <ashok.raj@oss.qualcomm.com>
Subject: Re: [RFC PATCH v1 0/2] genirq: add migratable NMI registration and
 show NMI counts
Message-ID: <avzXou6jLGuZYTDp@hu-ashoraj-lv.qualcomm.com>
References: <20261114234946.818072-1-ashok.raj@oss.qualcomm.com>
 <452bf82e-52ea-47c1-9074-eeb614a33747@arm.com>
 <avtMA9bb9vwezquP@hu-ashoraj-lv.qualcomm.com>
 <avyfjl6ZLbpilWkK@hu-ashoraj-lv.qualcomm.com>
 <87h5hf8b5v.wl-maz@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87h5hf8b5v.wl-maz@kernel.org>
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afcd7a6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=-shGApArVcq1U3eIPRsA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: nbHUx2z5d-l7M9bbx_wb0JZ5QnBsLskQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA5MCBTYWx0ZWRfX0sAuMUsmNqFW
 8j4pcwR3y76asf6qlC3q4WZYOPtRwc7vqCYj87G9TJ3KzTHs0QVQPZ5a5eI3KylKKL+OGaoTc6J
 ox+4IoEFO5R5DYJG2NDhLn56a5bPR5w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA5MCBTYWx0ZWRfXzYMhj1BFVYG4
 19ZhV+8M1Ct06c3OnaCRTRVveCwPVWlibqRxeY5JOlQQzaHQeLcPkPFkJaH+GKTSoei2XH2kaxH
 3QIUHe4Ls0I2NcvAkHCL3naluyq0RhO9O/xeU0BUBIP80gTXWXRSk5ZNB5+Y7/FtWHEp74qj2fc
 D3lymEDr5dwLL0SgN8yGaCG6i/h6U3bsJEczd7DMkXY2b3ihr5L2Ap7P7GNdT60y3hrxFFZ/J36
 xTj5Q/5rAq8gS5mT374XMT/h7wDeFBGSpjP1/Ah6V4DCVJe/2GfV+tF0h+hmbsXDCXhF/1T8/B6
 tqKbEnyHP5WpT05QkdR2jjXFL7pQZsXKU/qLuHwry6qStJEU8yVI3Y8E2JyDGyy2E+F0pg5WdYv
 QGgIMU0eruqak2QZF/5eODDZ0HlexKhfP6zg7srhpANgkoEvSsSQg5JKGtPlG6M7SXIJUP5e34+
 pkSUcXZf8OlekCijLIw==
X-Proofpoint-ORIG-GUID: nbHUx2z5d-l7M9bbx_wb0JZ5QnBsLskQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170090

On Tue, Nov 17, 2026 at 08:18:04PM +0000, Marc Zyngier wrote:
> > 
> > I think what i quoted is true for regular interrupts, but NMI's there is no
> > IRQD_IRQ_INPROGRESS serialization. So that overlap as  you quote might
> > be possible. 
> > 
> > I'll need more time to stare at the code  and rebase my RFC and post a
> > coherent series that uses it to get the full picture. 
> 
> When you do that, please don't mix functionalities and tests as you
> did in the first patch. Slap the tests at the end of the series
> instead, as separate patches.
> 

Thanks for the tip. Certainly!

-- 
/ashok.raj
ashok.raj@oss.qualcomm.com
Qualcomm Inc
