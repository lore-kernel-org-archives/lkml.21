Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795412787;
	b=LqhbaJgT9w1eAIkPR6iwwT90LGftszCFg4GUTba3llEpu3phO/cJxzG9n63rSgYTGDUx
	 Q9At+3BT5n5UMBdF2G7x3I1OmxTPmLFL7icB1Vfc24LbdeP7vVGblFjvjYrnAfjYfgM0f
	 i3xw9VKuJyNDyhZkHAnpYhb4viRXo4iwGNZQFH/P/PZF5Se85ABb4NsnrB9apt/SvOoSo
	 TPSVX4oXlKbsCBqAGlD0OwALk6reCEkGiVoO/0bNLhx0hDkdo9uoH/RLKIdJBmkmfUVM3
	 MEd3JQJ7j/LvJE5bEyEI4eFyEZqOshA+h7bwpHpAuYFC8F16d6qO6wkPz2O4f33SstA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795412787;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WDdOZbAef0VZJUq8GHeZZN1Befvz7h+o1H703vna+VE=;
	b=WQ0XmpzlPw9hx1hgAKnESAUzSg3OnKReRvpebgYvq68DBJ7R/cAX6AbqoyXTJxlm9goG
	 NQrTE1zbslDCgHuONTqFphUpTfTlP4cmFDdxzEb3Xk6NyuZ8tfI2KsKK7uv7BX/Ur8qvk
	 xCADpVe4jJIEogL35ywxWGXbBkpDxiJR/MBk+Pblr82mBe+wKadHwJsfLazPfExHuD/iJ
	 poiOWX3XyzahLk92CSg/il4D8SgAJk4eVtJPvScfbd4q3wHfU+O6Pbyury4DoJzS8sO9t
	 2+vSZayDOolsoDGf8y3dYk9C7TVFjVbttZCuXPiYEtseW8b25aJyvWM9SzEaxoQcZ6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=eyBQmLoc;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=iY5Le221;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7ED606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:46:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB7ED606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=eyBQmLoc;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=iY5Le221
Received: from pps.filterd (m0499199.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN3YBlg3924224
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 00:46:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=WDdO
	ZbAef0VZJUq8GHeZZN1Befvz7h+o1H703vna+VE=; b=eyBQmLocBEnxAn3RL7SN
	cxpvSnKSDfx4CShgBEFehjOQkpPAto2AqDp1fZc3OV6rEchZANMo3ed39PVKMCuQ
	rlIaSuz6+KHv2xwQSPeGMJCwwzyGmyteNde7PYNE4qOcfLkq8m7RQf4df9WqNU5S
	OGu4TKiVPPLMEYcukEciniTiC0A2W99NS0wwhyL6s/q9LBLCoFhEJDjH1OLYebJQ
	s40EfeUkrq4RYceMa4Sk+5kmmowqEer1xw2BkHWOB2dGL1BPh5AACK7oW06otfwy
	h7uu2lNzh6gdYQz1I/9lNZsD9mOjkRcIBpzSURKurTJk5wK2lumfS8J2jFrUz4nf
	0Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4j3tkx4kvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 00:46:19 -0500 (EST)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9213659143bso59009516d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1795412778; x=1796017578; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WDdOZbAef0VZJUq8GHeZZN1Befvz7h+o1H703vna+VE=;
        b=iY5Le221neFbE3zr5ARx+0f1B8tbd8Q1gPbGPei3hF+X4oLEENJjEZtIZRTjY5UuQS
         aQykmgvUNHDc9mhC+YlPdytgTm4wQQlDOa1Zzwu6gr5+vdihGK9bqwvNW/TbinvnM5Rj
         xXyACtSh2oVFn0rwGSO4luDQsDw5M4JgfK74EoQxLeKtICr8eRhu2uMO/cZCRvTxPm8c
         /wq8OfinG7ofM80QY3mUrf3zpD2f3TLbERi3Eyz+Xka7Z4MtMJ05iyovkeHskb/unl07
         Xvk2gXCwu5VHYZDf/2rVFxgTMMTRNYCvrATFpjyB3pvltkROK+HcarIuuXnKgfumTvNZ
         qMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795412778; x=1796017578;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WDdOZbAef0VZJUq8GHeZZN1Befvz7h+o1H703vna+VE=;
        b=Mg+3hjJo5DiVFgYfhNvDmhfb4sB6lV4jpPXS8TKmUE79q2f4inNhDlRsh2zQwOJdv/
         Y/3oflhufkc3hmvPu7cqlFhraQAnnlhFdaVVkbD/IslHMz5ejDy2Iy/TAEyGlhrNGBgK
         +WC13dxtxsBPavqg6VHueA4FWEP4V8S5hXlehMQYMgZynqQUyR6KsTjMTyc0SPaqXzcm
         y+VTlMspbkVd6DbGPdxYl4Yghak/XIWZepmkC5fN6GHFt89Y+iCrpy7j7oYgJaOIf8Y1
         VlQSNl1EfDRM1EauMusC8GFqZijNaO7M7e/akcZl0LtevvOof0cBL3kVN4IzdeZ+omHY
         4oaA==
X-Forwarded-Encrypted: i=1; AL+hErEAHHppOvjSi9JoRm3NOZiGmJa8l23+JOkRMGcaHRyybzxfvlpPCloYUYyYY4rxN4gKmtb0bVwjt/Q9EHI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zcC4JyCrILwY1Oa7NloHLkgrfPn2MKHPTV1RixPAUIvnpKNLL
	8v1QYWYhkdztgxu4mCgvhZ4fp1/ojvNluyvoD9eNu8H1Ljl50f2j9Mv0zKjMrzz8LwRk93JnHcA
	Vic1BCGmKqkThqqGhNibR2ldGIibdlPWjFjlgPMat4++DeFSbFA4a5KbDXGZ9sLlHQT6b3A==
X-Gm-Gg: AZFdTZfvqA1rYDzGqZBIdpK+zFdk+u9ix+oLZPa7WMMRPjFNKfqNe2lmMOIzmPEJ6us
	CZLcARwLs05NUGWs5a9o0wOaMFmAScgCIr6/o1DWMoZtCXR5ys8+vaGOkmuxvx132+OvTtwDGkg
	uxP1MCpn4Rdvffh6lyV7Z0o8WVQUC5pKHlsbUAW7fUWBS9MdUNkkrIz2zgZQDvWoJnNO0Reh5F8
	u/0OOJh7kmdq3phipM07U3qM3TmtC1aPoqd6hlWJLFFVVEjv8bMJ9hV+5/aUReq2DAqj7a8+L1x
	g8xEjwOLz3BeLqJDIAdXGCSCxFqy5GvrTIeKS6O1zgNbBP6KRVg/9RGMcZAxbj5OhXp0BMuxeub
	ETpgVuysld39Ay02g9KTMgqfwBPZ6AxGNPHL6fHp7sMz+gObddDG6rTmxHtBGNB8iMXTRK+5SsN
	ZUjwqO/c1wkDxmX+3I5nPqmWe0aLC5Rq0cd2qj+EBi/jUIfB9cF6FcylhqcwBvT5N810jeYXMBR
	O1lzzecDxPBGNbyvSHDZbeW5xSl0WEtHKYpFIg8aabhNBjHu2u1y5xfQvtvJZGWjudm3viayH2q
	g+hTSzv5nbvbALri5F5Hguo=
X-Received: by 2002:ad4:5dcc:0:b0:91e:76a7:187 with SMTP id 6a1803df08f44-92134a9e8bcmr183190026d6.43.1795412778489;
        Sun, 22 Nov 2026 21:46:18 -0800 (PST)
X-Received: by 2002:ad4:5dcc:0:b0:91e:76a7:187 with SMTP id 6a1803df08f44-92134a9e8bcmr183189906d6.43.1795412778183;
        Sun, 22 Nov 2026 21:46:18 -0800 (PST)
Received: from [192.168.0.76] (dyn-160-39-51-212.dyn.columbia.edu. [160.39.51.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a0a454sm95684796d6.35.2026.11.22.21.46.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 21:46:17 -0800 (PST)
Message-ID: <2e11ba52-b5c6-463e-a5ea-c165ba935704@columbia.edu>
Date: Mon, 23 Nov 2026 00:46:16 -0500
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
Subject: Re: [PATCH v2] mm/memory_hotplug: don't offline a hwpoisoned page
 still in the page cache
To: "David Hildenbrand (Arm)" <david@kernel.org>,
        Oscar Salvador <osalvador@suse.de>,
        Andrew Morton <akpm@linux-foundation.org>
Cc: Miaohe Lin <linmiaohe@huawei.com>,
        Naoya Horiguchi <nao.horiguchi@gmail.com>,
        Vlastimil Babka <vbabka@kernel.org>, Gregory Price <gourry@gourry.net>,
        linux-mm@kvack.org, linux-cxl@vger.kernel.org,
        linux-kernel@vger.kernel.org, tz2294@columbia.edu,
        stable@vger.kernel.org
References: <20261105-memhp-hwpoison-pagecache-v2-1-029d35634d42@columbia.edu>
 <d4812513-6cfb-4865-8636-b83dd92c23a0@kernel.org>
Content-Language: en-US
From: Mani Tofigh <mt4022@columbia.edu>
In-Reply-To: <d4812513-6cfb-4865-8636-b83dd92c23a0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyMiBTYWx0ZWRfX9ObeNhZGbI7j
 rOrkBQG7FD7JqQeZE+bJ6QHCQlur7oRNI5c+aigMzi4bq66tzKxwhXTSqRYqI3Mfq57JJxwbhkA
 FNnMepQI+051DvdYAYJkWHCNeJXdRzOgtBt/7ttmmGK8Ccm2E67qTAl1/uvN5JkdbxtKseb2nB8
 UzwVWkwIi4kuIuopqZyrMsYans85qRo2pxyJv3RsJTLBDYA/DwxXTxTMwv8dqaoRDBRWqCMdNg9
 slnpjwKF4xnSo5tZUWSOqhnQMxNQTGK9b6jUCF9Un+cPEDy7lB2VE8U67CXoEDojDFa3jQ4PaP0
 9B6+ZXXKMUZpXO+S5o/P5HZM4QS1A5WrFSUHVzPHATq9CMxp5cSq4RsdWDr256q77Oy9YjWzGFX
 mjFg+Jw0D3qZ5kzzVaqp78g146LM+kBkB6FRAW/7wRxhCcfyqqBlyAwwDSzkHKceQ4R+kStR+hc
 biKaTvzXCCEeEdOv5Lg==
X-Authority-Analysis: v=2.4 cv=W8qtxhWk c=1 sm=1 tr=0 ts=6b03d32b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=l9izRfKDRJJ6Wn/vzKnQSA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=G--0XuH5328wxK7v7Suf:22
 a=CtMvlx9HVXp8zQbR6KoA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyMiBTYWx0ZWRfX7vfEie9buyvK
 ng1JsoWeWb3W6Jp0STQ4vqRgcjgTcz8V+NtVuaubcv4hxJbX2IJ41drRw44XBpnHwhnmWKCdh5p
 tjwD8Sp842pM11aCV2yIaJ9KvzLB8/YZSN0s+jdCeSjQn/8eIRyY
X-Proofpoint-GUID: eB0iFPBTPojT9BHSMC23DtCroL3GB14K
X-Proofpoint-ORIG-GUID: eB0iFPBTPojT9BHSMC23DtCroL3GB14K
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11974
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 spamscore=0 bulkscore=10 priorityscore=1501
 impostorscore=10 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230022



On 11/6/26 3:58 PM, David Hildenbrand (Arm) wrote:
> I didn't understand why just checking for the refcount is not sufficient. Can
> you elaborate once more (and please not send a new revision before the
> discussion is over).
> 
> Memory poisoning must grab a reference when setting the folio hwpoison. Any
> other reference (pin, pagecache, swapcache, mapping) keeps it alive.
> 
> Why can't we build on and?


Right, but memory_failure() doesn't always hold that reference. It i)
sets the flag before get_hwpoison_page() grabs it, which waits on
pcp_batch_high_lock that offline_pages() holds, and ii) gives up with 
the flag set and no reference when get_hwpoison_page() fails (e.g.,
a pagecache folio briefly off the LRU). In both cases the pagecache
holds the only reference, so offline can't tell it apart from a
page memory_failure() already handled.

So I think if we move zone_pcp_disable() in memory_failure() before
setting the flag and keep the reference when it gives up, offline could
simply treat any poisoned page with refcount > 1 as busy. That'd cover
pins too. What do you think?

Mani

