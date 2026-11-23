Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795470568;
	b=VdM7hTYG0EUUdIseORX5iJ+qRxLPqq/cZ0E/+aC2DED23hUsgzd10x/vqrhC1wkSWdwR
	 WCCW767Kz9WbF0psXjDxXDFVssJ3Y7S9U1IU5srILQ9MPoaDiBVjKqUfiyN4UZbMrExlL
	 FiDmivBSHlNwotuhUQlHtn0HdMdr8XfBAnuS6kvURM2k6cGZpIkEmPk67VewCEmbLTVPo
	 2b0XXDFYNE32oKSA5tVRHbnz/j+XXETTMdXWJkAhlezc/THvrIUaR9FQKMaJPUyeVGiqo
	 N1uxY1wPZbTML9EaUYTbd0yOV43DfEiuLYveMaGRxv0SJNVjlonHq6ammeb6iYjF0lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795470568;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=imT3cZmm1No1iiPH5Dg6eys3wWLgCTx1cHGRKiZuXwY=;
	b=kQTpCuXZquITlH1+JOwz3/dMaaP7h/ssfnETMABhe0Jum90BeU8P3yWFKnhuF/iGrPyg
	 JudqOUhoiKts7+GztmWHu5opqhdfBFEUnCaXU47N3ab9drI1oFTJVuWtIiXZ59GvVdY0M
	 dpDe+FK7QuDtva1GCy1GedLzRtdB3s8k8Tt/onXDq8LS/TNX4VV50QRPR5ZxcDIfAGRey
	 2mgiNhVRSOefTcOcIGH0H3DLPdYS9SWv6ufCS7+nkFijM13OW7oFWnVna1Zq4YfCbrE6G
	 hN08uwouRJ+CfNaypQMAxxvMJ69uHCS3G3yhuu6YL+PL+00/k2HUZBIE2vGk/0JSlzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XFEMPgBv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RhxkyPxj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58706606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58706606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XFEMPgBv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RhxkyPxj
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuS1i1332575
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	imT3cZmm1No1iiPH5Dg6eys3wWLgCTx1cHGRKiZuXwY=; b=XFEMPgBvu/e+tlYn
	FrvE+Y9TcI69AQc1mMsSOuh2ZZ4cl/kUqgt6M8NCaPw/sb0mcpLNSMLoHL1Rc+I7
	ohsLzKhGbewo1AFr/ZaLrx+r7p9BDr1kFwAc0atsbellGtAR509/HG7o8N2UWrGS
	HwJT0HpeYy8kMCex4ceZ6/Zuo8N44A8I0rJvQbvBvTvIEuFi7Ru5X6MBvLzmsqIQ
	Qk8AOMVUWC8918kebY9SXfe004UImtqicDrDPCEeJ5h40+6L+1e6qoX+4TctuMhZ
	u723KOEXej1DYH1JtLV7eqC64K9ac+DQUjEoab/ffR3W1m+XrZJ7XSm7f37lb1ao
	SAd7EQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g743mk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:49:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94961511b61so643081485a.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795470566; x=1796075366; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=imT3cZmm1No1iiPH5Dg6eys3wWLgCTx1cHGRKiZuXwY=;
        b=RhxkyPxjvCUnDvFVe+ILFPksa0yJN9MeRh96aKl0kiOADU8qQv3DalUezF12wodf7H
         C18u/0Jf6ulfxQMceltUEJm2Us8lU/PnJErNM1nwwlpJpvGTNF/+ogDPJKEB8cMkv8KA
         1JZYfROLr84aFL2xlTdOTuMhEI7y5KeFg3LGzzwd1OeawP4SEvJZgbdNWI1D/25iTHpq
         bEiF9+5jTYrFG3Z0f4uyILIxrrGlpw8spx+QspD9FHmDBzVycBwPMRq0yuFFYQb5+cF/
         wJOdPmdOW0ROWahW3Rt2yJ1HxOfMuaZFz/B6W0UQ8mTYiwAsZN6XqeKk97hDZPg1+pE2
         w7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795470566; x=1796075366;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=imT3cZmm1No1iiPH5Dg6eys3wWLgCTx1cHGRKiZuXwY=;
        b=A2QFT0HjHB8aaZtvF+yVeD7TMKM4e6GBWxCyMKkSO0Z+ahQYchqjIFa12cLs5dof9a
         QztgpPUqZdL8/0SifW9Q65ikh7BlUr/DVQO/Lk2TqsSw8Ppz5DlEDXWmyCrJsmpmwweZ
         tzZZAXlLyJA2RK7nFX6lBXzZN9s0tx0VRpgAGXO4zfJY7a60+qXq/3CE7JHr5/+UWvh6
         n8DfEQhOu6C2maAEqi3YbJwcHlZa6pl3bpOgMxaSZTtajypR83Hzt97EfI4Zh7NB9umT
         I/OV72wFtvnXmkXsGqp/9C0v+eJTLcy8vu8fz2rwunUE7+lmOIszmjE9SLtEm3Qjh8os
         lw6A==
X-Gm-Message-State: APuU4Z/5R8Lt247kdaVo8JD4mM/iW6ngdfNLSZLWhWpNKcIJjnGP4MOL
	aY8MzcYQXz5n7mLkH0rh87zU1PzvYLHeX4gSlTS4XxoD5RaNh4lhUxEua+wMUugOFl+gL1dk9ME
	/q70ahoagnq+tDaIK73NU5TEQ46sGr+vwmz1RA4aIeA8egEjWoPj/ubcYWJg+ooJr504=
X-Gm-Gg: AZFdTZebNnOQifS0HH0nbwJQQcMNmoGB6zIFlrdUFL7TrRqfYLKIrcrsJrd2CEeYVFg
	Df3gOJk6mM9BwlvxU8RsgU3xrcTvMUeHlsLMjPROu6VZLMl3tF8mjete3//FWqNMo7hWoajKRmC
	2Hy9s0hE4dowDtGKYL+L3YX+qpZJ+s7k389esKeWZAr54poRqycMKcmYhgdNfbydDlGKGOTvsdH
	NJqZXieYwX8iskQFusplZujF+9MtyFZ7+CjkaMaw9elMfI7CJ0tHVs2TYrY59/vTGVC/3Qr1b3G
	aoXIv7XDs1vPuiMMwxusONeQHeyfnTKBuXVxIfzfUlGU7NrW+cKptznPX52HC88mKUFLlkYR1It
	M/n2oYrQIHV5bTI9W1M8FtBRX9GZQ5QnT1vXKMLp16YPI4tmYGWLLce6zQZQygtyjT5BhtIOVRf
	7z+wYYGqj7X+wc/QNolTmpPMHMCYpusFeL7F8=
X-Received: by 2002:a05:620a:44d4:b0:944:a46:5c1f with SMTP id af79cd13be357-949ba9a3cddmr2079008985a.40.1795470566544;
        Mon, 23 Nov 2026 13:49:26 -0800 (PST)
X-Received: by 2002:a05:620a:44d4:b0:944:a46:5c1f with SMTP id af79cd13be357-949ba9a3cddmr2079007285a.40.1795470565991;
        Mon, 23 Nov 2026 13:49:25 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:2904:b6b3:45df:9155? ([2a05:6e02:1041:c10:2904:b6b3:45df:9155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8533579csm340015395e9.2.2026.11.23.13.49.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 13:49:25 -0800 (PST)
Message-ID: <04471857-7d48-418b-bd9f-5c3ff3010e41@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 22:49:24 +0100
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
X-Proofpoint-GUID: nEJCBcJ952GKwFixt2dw0d7mv_aUXV7A
X-Proofpoint-ORIG-GUID: nEJCBcJ952GKwFixt2dw0d7mv_aUXV7A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4NiBTYWx0ZWRfXzdaCWqU4FefX
 IckJkkh7lGDJ9xjBBq0fkq314KETdcQHWW4L2EihnhourhZxTcEFL3SX1fQoLTVBYUGd30eFg23
 iaIeoRhS7u/YLVWgdSGh9a2uNDQ8XPg=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b04b4e7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=1LtqeKAUxZIeCVZ3D7kA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4NiBTYWx0ZWRfX6fqbM2+vslQJ
 1YwR5/A9NVN0RDB9xdJqnF9vcZryyHZP/r12o3UAcgZgKvWhZG0ehcbszHXC34lHrlvwNs1v67P
 Zw/+/oTsrVbF9bSDSy9vw6Ga+K6QzIMzTf0hNJNz/ZLNo6XoJHPoBQ1dw+QAp8fSsks7YbT3mX6
 Ep7ZS0A5EbycLjR7MjAM4UUdBBcqcgrTJS6fU6PPoesA96olvIRfhW8iaQiRrtRNYC5PLx2NXh4
 vv/8yCBfH/yGQZdDoaIud9P+Sg4Ux3MWVTWqj3fQ6CJkjekgDDDSyj5u5l2/hs6ZKrkML8B8NBX
 fvkLGU4xhFOpAK7a4oPX9PPAnObece7yTTmUIbRan15Ok5BZ1CyrsTn6XlSG9i8bLL9Fv3pmqEd
 ksEryBphYWDHOmWrMmjPGDyieOH+smhQ+PyeCQ5fcq0ZfigBRCfr0VNs+u2ZLosPWRzeIqKasZ2
 hZo51Ewhf/8HTh8T7mw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230086

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

Noted, thanks
