Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795459985;
	b=PX8LxKwprdu/sME28D54+WpwKB0yedqLF6Kxy6Zs1Ii3ZDI1dPcj2UVMUZWS/5SXbWlX
	 O2ECVuS+ojnXm9Kk1LKwW6GkRFdkfEoLtjHeSOsD36odmaZcswzh6j+e8PDrMcLVfa2o/
	 nYs9vgj/ZX6sH8omKiPyLD4FL85YI5JbZHejvnf9ww0TTLsvqy1w1j9nyJ/L08MnNEKW4
	 LO4iUGJ66Kp01m6rCz96GO289PL5gVv8MqzDZ21NT0hrqC+qzXI2c8NTZWUIqJo1T6k3Z
	 xUu4Jcsnopy2Bv81IWdU6FdZpRLIPkuVJR53Y7oGmYM22GPzpCILnIYVXh/kxLL3Rjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459985;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=P6R0QSCNbNk1SukQBtyG2ylmuRMbEBKxpRVoIoiV3uQ=;
	b=Ym4DUD3DyUQzv2yT5bdXQEjrZtjXmsd80vBqLAf2/6W9Oh4+69zoEp2PveMuTlQyo3Ut
	 CqPryTdGrhc63zHXrN1KNfwlFjEFw1FGeRRYJJM472sWPZ0FrlvEVQ7u/vWHSXAFlsxP5
	 ar9LwxLlpqvt4nHfnfwdJslE9ZGjIYt8wuomRPxLLYsvZQBTBxVF1MBtcSz+uWL9Y0qBS
	 vphDnkmIpqNLAogu3s9oLWcHbD/vCbUDD84F0QkHE4xjAj03LU1K1hGAx/CH4FnIsxlNV
	 BZ+L26r7rH7o3994SdkaEk7FfBhmmkq3nxgcYVMtPOAYGaKqB6JnvRui0RRwU+twAJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=temperror header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=gzuXgMoA;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=GaOzzKHE;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F121606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F121606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=gzuXgMoA;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=GaOzzKHE
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANHXmQU3935691
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:52:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=P6R0
	QSCNbNk1SukQBtyG2ylmuRMbEBKxpRVoIoiV3uQ=; b=gzuXgMoA+uckMmlPIc5p
	OHUQNFI2gJNlzZrc8oyiPkXdE2EiJ5o6d0vzLCVftfYXFPDrScbG7mSP1PZWXMku
	arTqF0eLNWJC7iW31YXiJukQwX3XY04g2sgpmnBwMLr+1UwItPUtZkgDKLOe7OTP
	ANkowItWbAYvWiZ/ON9u+XZkU2O0lqNtZaD+ea4p0vPJieNxB5L4kw3ruDkkyBzo
	GnPT32C5khvaFGQ0m+YLlByja7KJU9OHfst03i8b2yzgEVz7FaikMZTx3iQwxfgd
	s+yxwPXyflJ+bflynH1xsA5ab+QWEUQk91ZlJ+PliG4k5tzZAVzkicCHVSueY3X3
	Xg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j4r51t26e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:52:51 -0500 (EST)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5363b06bcb2so73442771cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1795459971; x=1796064771; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P6R0QSCNbNk1SukQBtyG2ylmuRMbEBKxpRVoIoiV3uQ=;
        b=GaOzzKHEwQxX0kp8JHsriAJ3PXU46myEtnkvBrRPHiFl3c8j6XG6/7X4qfpJZm85a3
         uPb67ZIw/acO69+Alzo1dt5Ibolgub4fh0BlIJu6w51sHPopt7zIr+0jz4CMncvn1LZa
         GXFGAn10qyvaF5fvKp5RwW9yPzeLxs9jKXavuONdoRgrcmUcF8DGjzadLB/0Rasrs0Oe
         4VVpKX/Jr/B33dOikiu2sTp1ULPUGah5++fHoz/mB4/nPpiMfLFRFVKxU6O8f2ExCMWO
         zuZ8+o2q0hPymqLm67NAGaeFkJpr2xBwmWQPLH9Vi8mqXtUGdXBJ6TeGnR5lYVFgYgzV
         mT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795459971; x=1796064771;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6R0QSCNbNk1SukQBtyG2ylmuRMbEBKxpRVoIoiV3uQ=;
        b=DeCwuZgn++eamJov8IegeFpyRWRGIYmdQIXt/imC9SwcmFjCyjqTo1y945yCniZSje
         0u7ZLPWg+HPVF8iTKGCMlhvPpDOyqgyAb+3ksdtKr7a/piZcMiR3Ez7GqtZSYzYOdpPh
         vCsbLBc5T9BcZSCGfh34GKyi6NWb+S+uPCbhcRQKtBc6l1adIhP+jJ/wiYjhl3oo3Kwy
         IzTIh+GNfCpGYaRq8+H6J7A5ElHcqnHZHmU2KsFrrf3WwozhYEbesMW/PBJFCRXgt9YU
         fcooSBzOVJZ1ubsgmS4irKSgnxDsJRDCj2LRTo9NJx7JpQvthE4zlBnFldwCHLvzp1Qs
         8Kjw==
X-Forwarded-Encrypted: i=1; AL+hErE4msHgIHsco7LGeAVVlXLnBwYvCfQiLFGk29rjHwE4LmcX+xJBlxSEogSzm13SkTP8U4vivz6h8oTqU3A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8e4gws5+o7z4BHZJW2XaPfFDcvg9LmN8h0jeBwqOKkxH4WL3J/
	iqTw98sYzI9wraxA9cXGSZ3rM5JRipJWwJyslN5TmB3bYpxYfVeQqn3lALupOrPlGUdvY2VmBL6
	HW9TAAfL0Yiuv/9d8jPVxltBOSrt7YYZtmZSSQt5KEiOLSd98q4aXM8jBh0JEoA==
X-Gm-Gg: AZFdTZc2GTCbND+ALmiyZcHTMnUoQpQgJGXe1OUZhw0k235Soyy/stTTB2ROQef0dhy
	8h0i2KS+YZaZqVAPIpaBvLAPOGnxKdr1ta5F9hS2cDdvMEq8J6+I9qnb/CVt28SIcb1UDKa6xPK
	qYf8jFfIwtGOOsC2r6AgQUmAI9HhsSYRdorwcV7YjQhxh+XIqz1pmnl7QCYpx/FkaQxIpa3Sl2z
	8CI4h4ZmYq+aV7I73iM9+TeUgxbITwmC/IkLrpMWQWdH32OkDsrQMva3VuTOLDIQJ3Yx/eMqiOt
	Z7ZLAPI3C3+mWkWGBTJJk624Vjmmp2Qrn59yRtev/7yARCVxZond+uQ2+KuDCUWCiwMvFq47bpd
	0xF99lzCNr1VAUUKG7zSyUfwmyoadq4KzOAamx2Gz4WBdvFtZcb81AuSdp7t7e52a2d8mv8JDW8
	LF9Q1Evc1AZ6dE4Okjm8UkjtnqUwakZgw4wKdEEmb913+fWPUhxL0WbIUwbjGHXlYB8vxj07tDw
	vOGoxNJnrK4aa/C/M5yitROhd3UXT0opDWPOLEUFgACpV2hIYzgOvB2ljm0ihYMhoA=
X-Received: by 2002:a05:622a:4d96:b0:535:232f:ca25 with SMTP id d75a77b69052e-55d7698efbemr222965731cf.7.1795459971439;
        Mon, 23 Nov 2026 10:52:51 -0800 (PST)
X-Received: by 2002:a05:622a:4d96:b0:535:232f:ca25 with SMTP id d75a77b69052e-55d7698efbemr222965501cf.7.1795459971100;
        Mon, 23 Nov 2026 10:52:51 -0800 (PST)
Received: from [10.206.149.246] ([129.236.230.139])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788116c9sm106773881cf.4.2026.11.23.10.52.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 10:52:50 -0800 (PST)
Message-ID: <56de516a-c895-44a0-94f5-ea7bc5bd3ef9@columbia.edu>
Date: Mon, 23 Nov 2026 13:52:50 -0500
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
Subject: Re: [PATCH v3] mm/memory-failure: set PG_hwpoison of a non-hugetlb
 page under hugetlb_lock
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: David Hildenbrand <david@kernel.org>,
        Naoya Horiguchi <nao.horiguchi@gmail.com>,
        Kiryl Shutsemau <kas@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, tz2294@columbia.edu,
        stable@vger.kernel.org, Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        Andrew Morton <akpm@linux-foundation.org>
References: <20261106-hwpoison-hugetlb-ro-v3-1-c11186963647@columbia.edu>
 <42a60f57-5323-f981-8ef3-2e5d67623902@huawei.com>
 <a87cbd92-0e07-4f84-9a6f-8db0b1778fcf@columbia.edu>
 <b0f30561-aabf-2bf5-2204-20907c40ef43@huawei.com>
 <08b18b88-3ab4-4681-bec8-f4564fe9f1dc@columbia.edu>
 <77680005-7178-cb1d-6e20-e23519839222@huawei.com>
Content-Language: en-US
From: Mani Tofigh <mt4022@columbia.edu>
In-Reply-To: <77680005-7178-cb1d-6e20-e23519839222@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NSBTYWx0ZWRfX6keuRLCtBTzR
 S4Fo8Cy//OS3q9sLJM8W+DWWoHk7YjwdC9KBKLxIFQ+9yrMaQhENiuaOp5+E89WpCE6XV4QiK1x
 Kzk7bhIoE4JF+H91bNxIQr3AhXEHY2UPJHlBe+INcIxhCJKbckk84ywXgSsxCFB8649PMfHz+lv
 L1nwDj1TN/TEQPZQVWT/MKBhr6jvO08xyL0ZHUTNbxID0qg9t9/+DeJNWUba0hyyW2913IucML0
 R23lxzdCl0hjXcoU+EdOqvUPOKpoi+cpPAs/77PEr5uUmFqDTs6JVOb76+3SZ/JEzp7DTld4hde
 yD0XaRieIS1K7JOtca6/Opchp+L9D8KuNmBX1MhFskKS8W6erWKivfcItJohDkNhAYpZxR8olxF
 AlA1B3lnQvaTLfQ4jd9QMk04KokMbWYcSu5dkdYVzrzonvViC6ogia9bMvfIVZltKolPOIJezU4
 TAk7+gElMwGxg20CKig==
X-Proofpoint-ORIG-GUID: aikobB-3IYBgG5yJM_PnwA7WjEPUsy4c
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NSBTYWx0ZWRfX8Gp+Cm7ljkCn
 gl+J945bF/fp91D91RFFzck+jtmVoM0xJ3Fib3WKby+rslpkciKbm9BcuLfYpOearv9RLTiJ/UG
 +qdoDyCmhUOVamOXYK3r7qe+VNk4BaALFcZZnLo5OMZfCWPZSmJ0
X-Proofpoint-GUID: aikobB-3IYBgG5yJM_PnwA7WjEPUsy4c
X-Authority-Analysis: v=2.4 cv=Ve1ir1p9 c=1 sm=1 tr=0 ts=6b048b84 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=0AiHgshebfoioin7TVvpCA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=azVShVRs0zEubeQ0wG0L:22
 a=_vlgSMKLg18XzmzXuwUA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11975
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 lowpriorityscore=10 phishscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=10 spamscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230075

On 11/23/26 2:26 AM, Miaohe Lin wrote:
> If P's struct page is past the first vmemmap page, the hwpoison flag is lost. In this case,
> do we need to do something? Now that hwpoison flag is already lost, I don't think so. And
> TestClearPageHWPoison won't do anything in this case. Or do you mean TestClearPageHWPoison
> will always write even if hwpoison flag is not set? If so, can test + clear do the work?


Yup, that's what I meant. And good call, test + clear works too.

> I think we can correctly clear the stale flag from the first round.


Yes actually, so just this under Muchun's rwsem:
if (PageHWPoison(p))
   ClearPageHWPoison(p);

should be enough? I can do this for v5; sounds good?

Thanks,
Mani

