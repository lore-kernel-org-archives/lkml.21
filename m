Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455128;
	b=kN1kfzVLRgAXyQVpPQPHRqADFveJj2QaZx2Mej1d8vZPFiBAW+3rJliupTCdEqidriGP
	 wqyQBRU4Rg3fhzIsjsBuiUnc3N/UFQV3NImTHipf362gdKZPVlVMc/1LiTYBDHTZEmukg
	 eu2zIRnl+9F/UJ67Z10wOatNJUAN771LqJehLYk4SsFuHEmrhvTOk7hQEqExh7sgzP4B9
	 UAFTqT/cfAT2Iq6XACZmBa9D4827CY8T1iEhRYF+r9TfQczVVRA6lwSpk0gzdy7rNDNrw
	 gIV+iaEhhmtkf4vUPvf7OM48BgMxL7IDlxztrlyki+bwKqWSYbPH1aR5ipi6kzvJDTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455128;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1a4TM24Bx37KhzPX0EKcngcxqi/da9ANdKbxr2maRdo=;
	b=X39Ts9J9KHcA3kszA3vzu7ubPfa+Ak+j2uBi+5YZFjaCGR4c4w5Gy6A8Vmvdmaxf/CDb
	 /T0IGqgEjFe0MRqjNpaW2SA4cKDbpntPOnkqIW+7nJW5au1Fyv03EwK/04+KV5r1vc1IH
	 kZctxAbqczlGsqmHu5KEeSQqSBWGTxBhW5Cj39lAALapxXOrKjNBGdYQAFO+zd0k0a3lI
	 g4A1o7rNVQMbmx8QbW/IG3jPmQxFekiMj3vxZGD4OZFXErbDMf+Zeww0W1PgCz0m9zX+e
	 1M8rpQj3XKic75MYjgIBKIiLWi1vOF0I10n5OvlOZoTPjyLq4l8mUPHWkuZxB5q+1sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=e84uq7aT;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=fgajgmYm;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673C8606A33D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 673C8606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=e84uq7aT;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=fgajgmYm
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANG4bxT3437849
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:32:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=1a4T
	M24Bx37KhzPX0EKcngcxqi/da9ANdKbxr2maRdo=; b=e84uq7aTN+paLgiRpBNO
	jFpZrFwSkNAZb0pLrPBFBMpeq7xY5VF5Ke74YGVhQQhgB2XMzCUH3wtB+DektBiR
	qPo9ynkIbzCzlLUmkih4RkrbewMTNmaLvk6XxPhBoaZ8L4ukPmaKxPqpWeBbJLLc
	uelcoHkyG8W6GveecAnwBSg3Yp8SkpLpDehjKoA99YhreNu9TwIUWlL5Tbv8AAM7
	bQOYm9/5nWyXZcsZXTj1dP+reEx73v7sueTzpgokaO7URE3kspWKIKGZsluDsTH3
	+sZgnA+tjE6t19HGhCCmkFQBefGvug9EszN1p4Ts6fdQLWzQIgVR9TFNWu/q/bNX
	NQ==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4j4rpmry5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:32:05 -0500 (EST)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-67c58f18a42so6480218d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1795455125; x=1796059925; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1a4TM24Bx37KhzPX0EKcngcxqi/da9ANdKbxr2maRdo=;
        b=fgajgmYmeS2XJLI+qYcBemiE4xcL1SjJ3q6gm8aGHAabTQZq4w3gsWXurlCJ2bn5ls
         xaslu/vLTxTO0grqUUpYfv3R2YHBqaN3WTtsWeCI/vyAvcZnN/L/HBqXWOCqY6Tzz+YL
         i2jeC/2ToZ49F+CWBjS5pZLZIRz1ncc18QuH/N5wwi8ddRVzveDCC4Qj6LCTZ9peGRGs
         /n65F6pukhY1lsB2lp4S9LAr+Ri8arYWgG+IepkieWiAjyJ+jJGZHc9vZTSnxk4LlKEa
         eU5YvqCtEA4YwYi9PMKAkpy4nljRzmiVP4lU5u2LCpyanSlQr/UHsrBhhG9X5cMBQD8G
         /xOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455125; x=1796059925;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1a4TM24Bx37KhzPX0EKcngcxqi/da9ANdKbxr2maRdo=;
        b=26EILMnAtPs8mRguoSwzORo2/G/p0rVRFqA/Ygs7cr7663VGJoNcoD0vmhS5tXvRy1
         L4eQBQ9WS+kamrUbAOzWB0//UdRR24vgO25dcq/EoBPUn4XR5BL3qPbnr8l4ox/VD6+Q
         2mwBSEUCeQaxq/qbbjE9EyKRQzQMhT8+N9QUkA3zFYU88LICf2foVLQg9cveXHtYQFdX
         d3rWyCqe7HXEN+1F5Z4+PDnaKUh7zK255X/glwvzNf15bt6vOLykpihdFPNaAXE5aLLR
         FbyhKH+FspSwsA295DLgA8v2qFNSm9ngJYJasQ/QnOS4y+2vEwNKla5N05ZOt2kdDtum
         9cbA==
X-Forwarded-Encrypted: i=1; AL+hErFkPnxjZqgQtJ43SLDxDKhSBnvsZLU4IOtuQjJuh3tfX05pCT0TYwUCQB/kuyy8p0KEqqbN4uT0l3bSRTs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AD1RIc99//DIKYAnQiJx54IahgZ1jf885N2IRkMZGCwh1qURS
	6v0bzWdjnwUYWEDUBft2eVJal9DJCxADBH4uXYVCxGRD90+ZcfCYLBzIyQNBBQ/yZmQ6f2aVY+R
	uYIdhWEOt/facqQxXJh/xgeJs7ChXmXQ1NeKl1Bh1seUAEcVaiq19C2YDZ+t4Wg==
X-Gm-Gg: AZFdTZfPqsNJsm4CD1DCoTOtCi4NM3GuL7xLkcrRr8XYkxlSQvVcVlP59t+HZXBr7G4
	UH2R7jdl4X+8ydRYPmWG9SiJk3byN9BAuNXAg5L7ou5t9sDdh9U4heqj5BfMRuN58KmKhJh2xO5
	WasGy1OmZxvjxNpwZMLc18f9d++mleiYIvVEHNfRF1GPPq8yACdEsny2oyj1KnTQGD0LZ867E9C
	aiBOzMyej7QjhFazqClEIyoWR6W/S3BiPrZ/RNRmfz3Ou79g9SUUOtwxmdrfOKwB6PcOusFNsfo
	afnxXIPE8AxpqVORsFaAHYVl7XlMiSWKwJt9ge7zvI2t+ceriGgVJ4RFH47aCcbRgSMxNBO7TeL
	+qYHuEucJ2HOkBqFl/LKN55LUOBKSgjSzO3HLxLA39HzgwLEFpYSic0yfub9Hy/YKM6zEACfflq
	uC6HZ/Y4+lIQgDVsbhszdkkiuUPlDTsUQfhwLzkdGKi7zuIPeX2notfTt5GTZ6XSrvdmSum6AO+
	tIusSgxIEU/X99e9GUgcbFLOuQVhdppmKen5m4mTAPeOOOICRK7LieVZgi9ps/5Mdk=
X-Received: by 2002:a05:690e:1209:b0:67d:c588:e55c with SMTP id 956f58d0204a3-67df42cdb00mr3845652d50.5.1795455124697;
        Mon, 23 Nov 2026 09:32:04 -0800 (PST)
X-Received: by 2002:a05:690e:1209:b0:67d:c588:e55c with SMTP id 956f58d0204a3-67df42cdb00mr3845632d50.5.1795455124303;
        Mon, 23 Nov 2026 09:32:04 -0800 (PST)
Received: from [10.206.149.246] ([129.236.230.139])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349f2186sm113214946d6.29.2026.11.23.09.32.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 09:32:03 -0800 (PST)
Message-ID: <625b9f25-9d9c-4445-8920-b8a4e549127b@columbia.edu>
Date: Mon, 23 Nov 2026 12:32:03 -0500
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
Subject: Re: [PATCH] mm/shmem: fix swapin livelock on a mismatched large swap
 cache folio
To: Baolin Wang <baolin.wang@linux.alibaba.com>,
        "David Hildenbrand (Arm)" <david@kernel.org>,
        Hugh Dickins
 <hughd@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kairui Song <kasong@tencent.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, tz2294@columbia.edu,
        Chris Li <chrisl@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>,
        Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>,
        Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>,
        stable@vger.kernel.org
References: <20261027-shmem-swapin-mismatch-v1-1-84e30aa3b9e5@columbia.edu>
 <3c61a49f-6a0d-49eb-8682-aece4e7e7226@kernel.org>
 <4af8b7ef-8028-4b98-ad21-5620f8b92f42@linux.alibaba.com>
Content-Language: en-US
From: Mani Tofigh <mt4022@columbia.edu>
In-Reply-To: <4af8b7ef-8028-4b98-ad21-5620f8b92f42@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2OSBTYWx0ZWRfX3pk6QhMdyO/W
 GSPIaR8InTNAIgxUDxgWlTMGViMA7tOG7F9nLAEUMMhnf7c+JcpQy9Fh2dvbSoryt+0JC4H1rXT
 WJjlaaOYF8RJVDT9Kkm5K0GN+3C3LG5f/buGkBU9VwbS2JsZzG9T
X-Proofpoint-GUID: xTamqgpqdXgK3-4AZ4ArS1pj9LpYlYYz
X-Proofpoint-ORIG-GUID: xTamqgpqdXgK3-4AZ4ArS1pj9LpYlYYz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2OSBTYWx0ZWRfXyX/XoJgPNGoM
 plyuAWMX9lCfmtfvyR9y2GpJqV4OGzTOEKGAHRJsTcLWqoknEMJOtjkcLjL5vg9Yjn4oPJcNzjB
 xEVSe3ZkF696q5/TEC01wNf96e3IT5o4hrYhv1RxTHMUUiebVBCknekEIXW84USW5G848SeMCpf
 wovoY/9j7rTea46hO/aFYTLVwKpgmNykKa7c0BFpUYbvtxPVq7tXdFAiftfOfHJMXL7NEX8jFYI
 i1BgMIhTlXEYdQCHJ1EdGDaLARDA4a2WFCrRmpttFVjTPT6ETHgtw1OaMJg5biv497SJHAWHFmI
 xgnq4qqsIbmYr1cWIzdnOWU+KkhtQfZslr7mVk/9msgcJG8TwJlqZKgRg/mCtWwiZt92SDKC5Lh
 4efQ9THxpXRabHOzHd4h4Ly0fvMDkByBTKSYHTUhqBoOKpar+48Niu6e2pkfDkhosBeV/Xc91zH
 wOO718xEh4ZYCPojsJA==
X-Authority-Analysis: v=2.4 cv=LIvz05W9 c=1 sm=1 tr=0 ts=6b047895 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=0AiHgshebfoioin7TVvpCA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=VwQbUJbxAAAA:8 a=EcUMADH1NWUpQPqG1_UA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11975
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=10 lowpriorityscore=10
 adultscore=0 priorityscore=1501 bulkscore=10 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230069

On 11/23/26 2:18 AM, Baolin Wang wrote:
> That makes sense to me. If Mani has no time, I'll take care of this fix.

Thanks Baolin, I was actually about to send it this morning (and just
did!) And yup the race is real and the patch fixes it. sent here:
https://lore.kernel.org/all/20261123-shmem-swap-write-failed-v1-1-41a0115dfbf1@columbia.edu/

Sorry for the delay!
Mani
