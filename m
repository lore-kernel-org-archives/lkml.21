Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795414272;
	b=iD4pzKgXF/YKAZZm1KoeLVgNPPt5siMzeAU4E/PSg2eCRRIJD8DaYGZYxx1gtpwZjh8+
	 O/ATa8Gwy6dSVkr/9cucP7zG19FRb+dZE+gf+5KP55EkywyICMdpgKqmOEH0Vq8omrFqQ
	 QjPvRFfANH+3aXZ1eh/7fdylXkf/Nlo3943Izx9f+ani3fE21xOlpJuIypu2q0t0MAMhi
	 XChHg9rRIUvVJWVnyxqzVDdO3ByKXqvRDT5Zat+llar6HklQNbqDjMbAF8yyADwkGi7kO
	 U0ZojxiTDjZYjQaNmKNHvQOaE7LX3rYRL4AVNgxX+GxcRUcqneHCPdP/zjuhukvwukA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795414272;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KSzhoyMwT5e6SQRPRpjDWz3LMqHPstqyWrWP4FXLkKw=;
	b=g2AohC3SyFsnzc4RH6+/KvopVrw2Td8IumC1Xw+1kCguQ1VZwLhiwu1CaBYa9R/39qSG
	 1FBt66+kasTsT9B6SuaSdqe3dFwLXxXdgdgEf+rCadOc+EasF233MqjuLVSgSYQ9pOW6j
	 W1b1EOXTbZUn28zgUlzjd7UnMYpkGeiMbafbV/v3jBAi4q1GSLuPsc9MgxFAC2Jx3Okyz
	 Je22biOaT76VPOmBPoAVFzxsep0AJ2QfyxGVjEuMzAkqncca+5MRLbvslz1u/VITTbJqY
	 3bLUtQ5CcD2LwTvX7IyWQTH+xF/MTYM0/n+LmhMlYoO1X2u7QibyEb/AwgKZJw7n2vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b="RI/E6NUQ";
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=Qlnauq2V;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AA6606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8AA6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=RI/E6NUQ;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=Qlnauq2V
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN5vE2I2144127
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:11:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=KSzh
	oyMwT5e6SQRPRpjDWz3LMqHPstqyWrWP4FXLkKw=; b=RI/E6NUQQfWF+ohmzMg6
	+VOhfBY83U8R+JfprawtsYS2H+16DJCjm1N4N2YDu1/Wr4L3HV4ExwOjeL/YVfl7
	MxCMkVsh1DudQiwPLm94HVzuSSZ5UIIMFaZgqZCjCx0JYDwfxov360yQl6P0Nvyl
	nw87TuIsFclP5YpzE5Pc53vtEgvoPEat/AtYgXQ9DSTGWq9xXrq1b8BzJ9fdqpfz
	znsWD37QGd/eM3/ha9J70B8MQ7OpWW/h1ri2BQCXBIF1EHQ0UEEDMKOiMpWuvi5j
	l8vwQwObZ4CzC0kfLRpo/v5emg/ReANqGWfP+A+U5OkSaJp2O7tQYIYdyHTClz1i
	bA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4j43ge2xwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:11:10 -0500 (EST)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844cb60so552081585a.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1795414270; x=1796019070; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KSzhoyMwT5e6SQRPRpjDWz3LMqHPstqyWrWP4FXLkKw=;
        b=Qlnauq2VhzFvB5toAIxcdpxcwT7p3qDGGHxBK8mfcRGYqG5i2zx9QBxZp5NnzQjnLN
         N8uGHzMUJP5uft4mF+rokxvynN9edm8aMkVrPqr7r2FY5YzwOsIbWMejQaC66wnUKKGe
         itphKDGLziKlp9rDGb5HATMuaxlHHEbM1WWXTrK33YUbc9S4tUU4atkP/4LG36S8+ChC
         p+utFOyy2/bK3eR51IxJUbRtp43Rh76EUXbfhUF5pSSa4OTNNqPQuVo5zQyqkwHd+VEE
         kDhUKhr2xtCp1akMvb7EoUmKzjpDfkWi7W+XUq8+K5rjx03hDvUWNDdPpgRvTUPImoqS
         hyjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795414270; x=1796019070;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KSzhoyMwT5e6SQRPRpjDWz3LMqHPstqyWrWP4FXLkKw=;
        b=LzVH8b+bSI1aX1ICVTcePyzgu/JHB1klfjnfAaWJqk3mbJFi0PlNsJrfrLJZ7EJFKV
         pUtbV3LJSfCr5/Scyej+F2CoAPd5co+F6Xjn3eFYbQkjJ/uAO3dl9/iKZtvtqX2TCoWP
         4+mVE+fhd0IOoFAhHIl+KsF0nHcfpk2rb2cJneFXjMuD7IHHaAWNpCm4yxLpvOBTgF7s
         3ebMd1CuqvkH01YZVUWgpSZsFW1maUVELk96FuQ8JnG+qk2JoAyA/6YbI2OHtT0h8T8P
         P++MWwpYqndERp239Xm+AK22gCLgHufNBy1na9c2AK0IILjg/z6NtzxrBhEXhQ9UNOjy
         WQ0w==
X-Forwarded-Encrypted: i=1; AL+hErHfdpBxVK+iRpBwH73J1ImVFhW/3BzRpiBkcYyXMcbXm5VcEBagQoO5DgBGLXhcU2WatmTE/9itaziVAOs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jdc7dcb2oAV5dP/yKausJvKsQ9GZ2L7qFQ2+J2jdnMspH9dCH
	M38LOzKP6K53lvIqlgVdOWpxJHZn7AlclEvlRYrsYpv1xRW1aFj3zvBS7P1KJ4cLKA4A8/Fz2cS
	hZRdFxIdNSQQZG8deN7Rks/ks9x+Kbesd2FEMGpkPGRb0grfhHmnMalwTLLYVZ45PkDsiwg==
X-Gm-Gg: AZFdTZeABPmEKbfC75Cv5pKl6IokC8DjqcvIjv1MzXHuyWa95LpRMckhJe5+NHYrkLh
	LT6P2d4F9y8llyf49USpbsU2aiOYO75kJyR3tEp7+Xt2mgBnbaO43LkMA7ABbQlvVYbRfOdpBJa
	pNCTdZQ/0D9BwuOT3PEzsBVEs0KvJ4iOBOkxwF9dDzKcAiAzM+jKQmZ/ykdYbR0n9xaeGQBpT9y
	ygsu04AVvmzyeK2IF1gIWE/Lf8L3HNVs8VWi+CzIVY5p/93inY322oEbgfls9B3QXLd41XcAytR
	ntbS5gLOMYlKp2mZ4uyrrSIit6WYTksPjbfqTfTwn4LL5JHHPoWeJOsc4kXD1Xr9Ev0HbL+RyV3
	se6e2dwlEnbUAe+jWeO/E58cOOda2w/rI87Js/22PGbb4lSOapSjfw4YAzxVkjofuxL/Y4YrRZ+
	y2kFgufjcI/Jyqroa/DFzzRLBnUjbV67XLUhaDcAfCsc/JKtr0wzG21rwNXKh7Eu2/exHwvNlkd
	wyFLgXsj+pzr+vwlcmMMOqYzVizac35ck2Hl2fPn4Bt8bbJICOup+Q4v0z7u69uF/vNVz9X71qE
	aiFPORtrAkVKBRWNTHvwlsA=
X-Received: by 2002:a05:620a:1727:b0:949:8109:67e7 with SMTP id af79cd13be357-949b3815a51mr2001859085a.36.1795414269936;
        Sun, 22 Nov 2026 22:11:09 -0800 (PST)
X-Received: by 2002:a05:620a:1727:b0:949:8109:67e7 with SMTP id af79cd13be357-949b3815a51mr2001857785a.36.1795414269671;
        Sun, 22 Nov 2026 22:11:09 -0800 (PST)
Received: from [192.168.0.76] (dyn-160-39-51-212.dyn.columbia.edu. [160.39.51.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb397b4bsm738891485a.21.2026.11.22.22.11.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 22:11:09 -0800 (PST)
Message-ID: <14836a15-94d5-428a-bb1b-abe4dfc0bc12@columbia.edu>
Date: Mon, 23 Nov 2026 01:11:08 -0500
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
Subject: Re: [PATCH] mm: annotate lockless accesses to vm_committed_as_batch
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mani Tofigh via B4 Relay <devnull+mt4022.columbia.edu@kernel.org>,
        Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, tz2294@columbia.edu
References: <20261027-kcsan-mm-v1-1-66757485b917@columbia.edu>
 <20261115113851.f809d47b8356755c229278c2@linux-foundation.org>
Content-Language: en-US
From: Mani Tofigh <mt4022@columbia.edu>
In-Reply-To: <20261115113851.f809d47b8356755c229278c2@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyNCBTYWx0ZWRfX110IoqKukG5t
 WdHXGiEv1azxXaii6JA7MfOFdkKAA2F5cUjmcOlsKreeB8ctuTSFDN5XDyR1seY5Me/DVpHoNME
 p2B5seA1SlpLdIjgU91MSNMuAf/ewirdO3bCHhlZ86snNo24H5Oh
X-Authority-Analysis: v=2.4 cv=c+M+0h9l c=1 sm=1 tr=0 ts=6b03d8fe cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=l9izRfKDRJJ6Wn/vzKnQSA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=GDd2V6ikjrV5M50Z0s0A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: ZqSAVIVLPfOgboeB3tFMaC25o9Lay1vo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyNCBTYWx0ZWRfX8Iflfxk0ThyX
 3caCte/EOIBaNEubmLjiJm1mLAiTbSovRr/HK4F5V5jJqmi8Ey5QxKPEizn4tE6pz3vkNdtDxn8
 D6NYwMfLZ6cqO6g0bHYvJNFjZeppXzxNaWIlEHCmPyWZRJCH9SkWfcO37TXJxCoJDG5OP+NLWua
 Wdc0oCqX1D4oiwxVIG3tfCPaPxiia7KdXl03ZLTlgO1VYALJuEJ6PPwRE3VKf/IkJlUVSp/b9ja
 +Txa+sv67hIuE2DUSe4Kjpwi6XqWcpbTydcI4VhNXsLWQLT6HhKQX7UqRS31qVlqfRGtdwHKgEX
 YPqmnSF35GULeK4+K70diQyD3dpDfdrb0x/fOg6WofdCn6sJeJoqV16o7LuxRS2G7kkVoKj3OLI
 aK3X+EmhykdWS4Otdq2fYbzoxGx8ELwzehnmi6BGyxB+mRIQ/AT+DaiOGcOSaYLjYvyFnyHPXts
 LWP2BEpxq4PYh9B6oGA==
X-Proofpoint-GUID: ZqSAVIVLPfOgboeB3tFMaC25o9Lay1vo
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11974
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 bulkscore=10 lowpriorityscore=10 impostorscore=10 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230024



On 11/15/26 2:38 PM, Andrew Morton wrote:
> 
> But why this change?

To silence the report since it's harmless.

Mani

