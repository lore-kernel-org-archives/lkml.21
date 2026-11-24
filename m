Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795490269;
	b=IhvPhRXzVQTxU0vHc8sk6I+wBclLPhJ5s2PRNcDunnNCYi/PnBQLwAo3Gxr/pm+wSHEx
	 EnjLdSAKwlUXD2K2y8uLOoiXhPCqJoRg+js3AzvXjMpZhf0GnD+FWnCpr4QpNXV419yzh
	 yei17IGFXRh7WmJI8kXPAGSIyaYB2/WP2GcwhRlkHVFT6G3oWghguNp+ZYUsdfnAJKNvr
	 II7p5UgW4/7WBJjETHlj4VvByyx9Jdz4/cMW1YXhjWaXkYLMbr6jNJu3tVBjDloJxm0xE
	 7d30b0tSpxaj8eQClZmzJzOmJA/sugo1Eodfds94mIIcRCtBIl9V1g+b7ed+XrF0ZqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795490269;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Xc1Jva+P5RD32pY3oC31LLn2mJzvWkGZ2xK0oVerZnM=;
	b=lPtWeVsG0uRhjkLxlfUpExA8ADJ0yghug8iyfvLqnaySgNmQci9jP2ex98W1RQv17NPj
	 0n+eKF5E/ZWWq0c2KShmnsfCN6VQfikqgFjXDNYbozChUVpWwJ/WyHW3Bu82bk8bxzmGA
	 0+Ehl3F4DqvTLT+m1ZKB5+wG00K8YsMjm0O2Y45UqLLbdy+HfSvHRq/9CPlg2laJWpw08
	 4PoJhA+Cyk2hMAMytbyOzARUpMMfVw1HeSdtjSEGRVAoyiCnx0QnMGZXgqZ1wlKROJuEN
	 DZRs8fWV9xS60sFR9MifsEP12QjsMwwDfkd73MQnRmEOBX6znvo0Illrr9Adm1dg2Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=NJrWZDvx;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=rQw60dI4;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6CD606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E6CD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=NJrWZDvx;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=rQw60dI4
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2c5E31954272
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:17:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=Xc1J
	va+P5RD32pY3oC31LLn2mJzvWkGZ2xK0oVerZnM=; b=NJrWZDvx6gQLk5DHzVnU
	5MdW6ovmyfdbd7htr9RqakV/rreAeRijEH7NIT5D70kiQ7HVUl+liLtLmC/Xh8Ik
	uUCCWYwSzbWxbSQMxvbUIyUOMEDtMFg2w0c9BqbvyykPGFj2wGASSwFxlCQonuZH
	cLhEtDIunLIe78ulwC/2giQUM+e72ZFXlpd9GxiPWWR+mrUIGzrTv7Zh567gNGVm
	I9uDrTy8dpJVXxAPWRp8+hIbnELGoYo7ujzH91KKGLblNQw/bYdDq+bLnlTIOiXu
	1jth3z36K6Ymm50as4Dr0xG4k6QoSkERut2znQbTX7i4VGVIPHEse56HVywu79sG
	mA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j4wm0hrd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:17:47 -0500 (EST)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-55d2bde4c78so61263991cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1795490266; x=1796095066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xc1Jva+P5RD32pY3oC31LLn2mJzvWkGZ2xK0oVerZnM=;
        b=rQw60dI4i+/gdc7xlMgurusfZmMYsIKhqTZDHioeEdkw6Qf9yfbJDhn8NB7fZRC51N
         CnF6tLps70jvEIPwXcoCYHDFGle4dZgP9bgtKZAM8rNAJHn0hRykXnZmjjLzlyfej8Uw
         dFvNHHZSL7zZ8We31QElLP4VICUjMEKtq35J3zU9WX20s1hJwUZa4nUs9paFnVw/YDrz
         aeWzm1I+nFIZmrREsniubILV7oNCwSGq/EErYU7mnxkiz1ZudyoroX8v0OPGSRtkXQVF
         w6zSHmBAXs/houfGI+cfKDShd1lhnOln2KhKtdwihGXmXz+dFq9ep7RyOu4Ydt6L04uV
         sq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795490266; x=1796095066;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xc1Jva+P5RD32pY3oC31LLn2mJzvWkGZ2xK0oVerZnM=;
        b=sFi7XsnV4jdMtOG8I9fCaaiYuoDLZvWEzjJlVm4N3+q636fhtVBu/nWLD124668K0g
         s22WI7l5jEMxF2RpxOWNmbFlpfQ9AIpSoevGtfognEf0YjyYbBQ5LMH+ARLLQBA7+t/r
         8Y88/GJznhTqZbyx/Lf4VtfMU5K6kDgMRAuqN91ZWhM8PEPFGfKlhbAfIk/QxGS81btk
         id9z2S2Ya4wlTO29S9EhmjFyDajO+MB85SD+zNBa8WTupTh1/8VbFa3Ues1XzUhiWV1R
         h6BCwfNLQ6np/43xLu4jwxQme08DJc0/RSmEELGotbLqcWFtbhvlXKb/0Ig5DEhi/OS5
         fXtQ==
X-Forwarded-Encrypted: i=1; AL+hErHtt+LnpOxU8hru4MXRrspLxLccoZLRphQ6Dys4odYUCfhUQbfv35EDot8QlU81AxQE2s7ZMQ4aZEJZ6Uw=@vger.kernel.org
X-Gm-Message-State: APuU4Z92fXPkUaWBjVnx4GHbDldQmoKiSIGVIetPa0ir5Ws1MqmKypGE
	+jGbZubfbYAIf6du8nC8UlV/Ikhu8N0oIuxc87zaNDp1kjNW5PDt+PWWbdr5y5wdGxJA2r1KHVy
	Cy9y/Yg01MFP43weT+ARfd7wKGNWeKTg3kpJRV3y0JiJjvKH2csW/P6vgnNJ8CA==
X-Gm-Gg: AZFdTZeIO4vnLe6/9MRM6lTyd6WAu7Wi9YtXYLvX6+cScMvv8uX9+QcWZDZz/mADUOu
	vnUi6A/Yu1yNlMtw963ko8uDqt9mP/l79UHgxyPJ0GF2vp0HrFYicjoQ08mQ8yAqNwUzD51qf/p
	Q4q6+6AX/ZgIGb18sP8OoyuiyEzRa7qPtwBpiuc8GriDLDgl8MMQOlp1Km8JuzhAl00Bw+A5ese
	2Lia1dakJ3DNGMlBPbJQEmKkN2AhkC0tfKT1rQS0YZ9IQ9wmWRTiPZhnyt2E8KDFG2JNsUvMWqz
	J6oyRGQaX0qmXDrNNZS6stI/0XvBffsPNBKmGvOXIY3F0GS77uI6NGlqyDZ4Mjw3krw74UybSTt
	vz+OAWrk/OTPwloI01dSa5C+hMAjH/tMtJFddo4RlOqu2JFuu9d1IKdTpVl9qkGt/gAwZdrSldM
	YxJwxxfaBP1dby8zKqvJZwwm4kFqcYCoZwzgdI9bmS5zgZ2CwaNCihkzTsFvS5gkeEdDK7tn1W5
	dmHBl11HpeclYVwSMoZDycG5+F/K/wkbx6SbkRt9LoesG74dhvXfP/Yue5gV5IaFGvb43cz3WWw
	vj0/GBi0Vz0YXfuQ8zkIwV0=
X-Received: by 2002:a05:622a:4014:b0:535:a5fb:6459 with SMTP id d75a77b69052e-55d76a97e34mr243107761cf.68.1795490266608;
        Mon, 23 Nov 2026 19:17:46 -0800 (PST)
X-Received: by 2002:a05:622a:4014:b0:535:a5fb:6459 with SMTP id d75a77b69052e-55d76a97e34mr243107601cf.68.1795490266274;
        Mon, 23 Nov 2026 19:17:46 -0800 (PST)
Received: from [192.168.0.76] (dyn-160-39-51-212.dyn.columbia.edu. [160.39.51.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a2806dsm120277726d6.45.2026.11.23.19.17.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 19:17:45 -0800 (PST)
Message-ID: <ed5e6771-785a-434e-afe1-90ffd10a34e6@columbia.edu>
Date: Mon, 23 Nov 2026 22:17:45 -0500
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
 <56de516a-c895-44a0-94f5-ea7bc5bd3ef9@columbia.edu>
 <53d2f7e6-581a-ec05-6dc5-59a892ace835@huawei.com>
Content-Language: en-US
From: Mani Tofigh <mt4022@columbia.edu>
In-Reply-To: <53d2f7e6-581a-ec05-6dc5-59a892ace835@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAxMiBTYWx0ZWRfX9P79vMg9Ui6A
 1VnZ2CaRYThyOf6BGJKWiXS6UwkR42PTPyQfl0MglT+C3E0IWe22eOBsstgCBKa4FT/lq2JeM5g
 OBQXn9zyCovb18Op3fFRrQ4ntktxChzeDjd5aiCjN5y1U8/y3C7K
X-Proofpoint-GUID: T4_pvmRW_ptCZUhemTdouqTthRDVTW4U
X-Authority-Analysis: v=2.4 cv=RO8mjIi+ c=1 sm=1 tr=0 ts=6b0501db cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=l9izRfKDRJJ6Wn/vzKnQSA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=Qm0qsxP7aFY2tkT6R2MF:22
 a=ksQGBAMdBnAiGY_M9A8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: T4_pvmRW_ptCZUhemTdouqTthRDVTW4U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAxMiBTYWx0ZWRfX3vhag5Xn7gMt
 SGgMXX+kkce0w1/Jc4eOiwgV5vhV2DA89MONGZ3njFhwF9l3krjqKc9OisoBzaTu5oWRWA/MHyY
 UBfPSjYqfGpWUrfIseAvP1WD28VkHLhXstKEW/HYFRv4zQH6MJIFe+nzN0Ky/KM9zwPlFnF1v38
 VP4PfKls7qPUdSXgCLAel9l1ghQL6xiKGFpokUOvSw+IALKqaS8/g9+9nPJ+VBQzcmL+k5aMXA7
 3FVN7nZXicGsXM+k0SwnMZc1e/SVKviHNgUepjmhm9kld2pLPmUXZxnsb7xLQlTptYfaxnjZOj4
 iv64AGfxp1S8Fge56OBUZlwu9y7sX1c72E7AWlrr1Pr9Zv/vJGASx7mUagC4Es1P+Qghh3NCcPZ
 igTiA8rW/5q2d4nyrWehikWkIsvLmnGCx3Ko2BRG2mv18JYMxnwLGG0ui5i5wVHy19d5pAxungK
 UCbqUsS8Hq/2F2b/WKg==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11975
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=10 priorityscore=1501 bulkscore=10
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=10
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240012



On 11/23/26 10:11 PM, Miaohe Lin wrote:
> Yes, sounds good to me. And some comments might be helpful. But do we really need that rwsem?
> Could we avoid using that specified rwsem?
Yeah let's keep that, otherwise HVO can copy the first
vmemmap page before the flag is cleared and the copy
would still have it. + Will add comments too!

Mani
