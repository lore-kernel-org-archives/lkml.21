Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795469956;
	b=Lo5gmxZRGE9dPfoReqXzLB5ggVPX/6jTSOrpFrODIuO754mcOPuN515T+YN0x4L841w/
	 9VDIE82u2MrTqy5FXybC0Ka1QinRwFGzTWOnjuy5JrdG0we8EdBoBT9lc+dULJlC3Cinq
	 CB6SUROr9yrqje3iEolBZv0e3FTP4c+5ONlz55dHPGgmZtkypPWpJP4NfQQIg72J2LKWh
	 v/jcuNcMxIToOtdmIvwlcjVXHFgGcZHPC1OE+FQp9OOJ4WzUExR3IXUN0Kj9U0VnHtpl5
	 KEGvhMjGVck5s01Ia0Fe424VCofyC8bH/s5ArbxPPrJDgw4DKNh60Gq81O7mM6mwZbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795469956;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7+ns+6vk5gP2peGUSfApSV2nXHAHSYEjInJo4+tuiEw=;
	b=QQQakGkyzDQoBo03Enjc0P09uF5FtaSjDHw3KCbIOnQtG48PCBxKsPldBOZ3CO1JKs4m
	 i1GWm6EiOI+h9DgYHXRexX7moAdE3sk1z6b3IqtC4KgWt3E03EZjvUxQnY/axGAXstBUB
	 ttvC585hsoeG/BGZlGQxgb/fPweFAr6GOOn36mxohvfrYom1y3KrtQ+4cSxPiXVWPBo72
	 Pa1eyobIQZm8WlAUcorQ+NQYO1SFZKEFO7LLCqdP6H10LV6pSMtnmQvRHRiP47PWL8QOx
	 pBSDerWa3Dos0d/hQEitehKEWgSppnh6bAfpLAtHtv8IHcLLSSw9+KUzkKB90JlVNnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BuCIVmqF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cmvhtRS1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B1F606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:39:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2B1F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BuCIVmqF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cmvhtRS1
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuRav3255347
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7+ns+6vk5gP2peGUSfApSV2nXHAHSYEjInJo4+tuiEw=; b=BuCIVmqFVVcWBvbj
	U75IfGwYOc9E8tIA5koyD2zVDpqz74wzjU9m86s6N6FtlMdBiX+B/N3wA5TSFoR+
	3wJOstwI5c/t1GQGMxHs01I0KRzBvPML5+xFd/+Y6VIEGPXU7GzrVQ4MWQ17rl48
	09W4iw1jIyxV6o23Li3thFmvn0DT/OKXG+IYQaGU1SK7gV6l3TBVVxLLdCnq50Iv
	9i3dRfdmhCf+RfQ7SO0wigILQFACtShFMMe6KX3KU4fL+LzpkcrCMDTyocbDZDhe
	Fy/AXGhCAiqxbavPrR6ENrzluuXqq8HNNeFWW/sSp5jBx3jH3hrBKBTDTo+n93fG
	4CI73A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pbhkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:39:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso4559961a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795469954; x=1796074754; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7+ns+6vk5gP2peGUSfApSV2nXHAHSYEjInJo4+tuiEw=;
        b=cmvhtRS14JbA4YT7foDBXu/0S1yC2TSPMvt9LeaPyzA8p7CWq4ZQuwOY7yp2fl9AZt
         8qT9rO3qJpme7rm1vxhp7G1ONfTfPo4rwtYxp1mCZD4ZREbGodZBsxOnnScostdnCpq4
         fJef4tig3hIRcSFAcGVEOkAgiiWBSEH8pLBaqrNolUp06qXydN+tYdjur5zro2BNeDm+
         nZmmxdSw7c05FkkvyPqFdo8kRtfSD+PWCrEwexFsCBAI5wKE2SrQvVe3iW9/O0sW+V3o
         h+eV6nQ9Pvb3+APHaBgFgJqceZklvlL+vXY3KgbHifsNYXp7JXQQyMuiPgnOJrFUKKzC
         JbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795469954; x=1796074754;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7+ns+6vk5gP2peGUSfApSV2nXHAHSYEjInJo4+tuiEw=;
        b=sg8fpJjHASParVsNsOViQPajnKPjTzSeaCl+1VDwFCwBef1hBLetAGIxvnhlgn8PJ8
         GcNTU4ZPPsmElnwIyjKYD6oDPUd1nyIWV+EwcTtAqD7w514/oD0AJYy4IXimFF0z55PW
         htHUU06d69HO8CMGHFSPcF5hhz4bKA5NLpO/T0EVPNWaRzx0SpTgIxVGB8wI1J/iCCM1
         KWvYsg8b92DqtVI5yyzpf9/fyT3mDnrIm96dTASJwnQmCNw+HUZ0skhGGAqovNaKG/G8
         pnX6jj0u3mdcT2wAr5/Z4eLByjeD0PNCeAuz0NdHf17D4j6RYriSfOLsggkViorXtbaX
         PDUw==
X-Forwarded-Encrypted: i=1; AL+hErELBHBjnnkE9Y4Tmbm4qDV0AdGuKqdVQAq0VPFLBsdpEhvo0ufiIHBnxpLUNZDWSy31+TDVc7w+PRrLgcY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LoE3MampnD6yMtDobIKn9rJzCnwvZO7sEKTI8+bhMF6IEXRz6
	TFMmvpHzuVKwyYMElwJnZLzvpVq4HJG0j/vGQYv6M7OF9ejwGEcig9d3vQhCFBDikbrqyiqbdPz
	cA9NzwYqjnoGkLaGHxFcNDvCYAMD2N/WZQwftD4KF6bxNJk2MaARlsT4JXVtM0c7jtHQ=
X-Gm-Gg: AZFdTZcBHk1cbh8ahrwh55R+mGhclGtjuUe2d9TMwrUInUYZvYZYxDQT+6miD30Zlsv
	2ZM80899n0lSKJLVHFcpVgZKj+NfvMd2CYYhWaUrKIFhU7MnFsTNaOfCP/rO86PZrOuY7lVJC++
	t2A0ctZ/9BPdq5gpyAzXeE3tl0Vma35BdV8UVAyOyedtBu3SPbr0ijDOTTIWS1bqF+TQbSnW+m3
	ZG6XaLeiyNuaslcHtoL+Z3twoFjKrHRiHVaBUyKK6q8lErZf8TKn3O0BNQHl7dU7Jrrwp6Olg+K
	ELZMhgjLoVSOxfOZ8yLERxONnZqvSbNi1HtEYfTpOgyRH0SQaz5DgI2ujwnqMHEC12xw5aqzBoV
	BhAJmXsTeziyiPjRHj6eGNhmkd8F5iSYwygbzTCKbGPOdH/hm8dLnOD+ho5v2TmTFdxtVsz+ORF
	AjEeSWP/KfeH7dFW8oErdTznh8koxVHbcNkbuiFAnx
X-Received: by 2002:a05:6a20:a103:b0:3f9:6c3:4c12 with SMTP id adf61e73a8af0-4014c25016amr14693288637.15.1795469953996;
        Mon, 23 Nov 2026 13:39:13 -0800 (PST)
X-Received: by 2002:a05:6a20:a103:b0:3f9:6c3:4c12 with SMTP id adf61e73a8af0-4014c25016amr14693250637.15.1795469953066;
        Mon, 23 Nov 2026 13:39:13 -0800 (PST)
Received: from [192.168.1.8] ([122.177.242.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87353b889sm6213767b3a.42.2026.11.23.13.39.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 13:39:12 -0800 (PST)
Message-ID: <680fcf4e-4e5f-41fd-868a-a0ce58ed77d5@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 03:08:49 +0530
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
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: linux-next: build failure in the final build
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mark Brown <broonie@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-phy@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <awR7nSOWkxRm-iP6@sirena.org.uk>
 <c631c19d-4fcc-4881-a6ec-9dad24419fe4@kernel.org>
 <b7fda918-8355-46da-b7f4-40e1a104279b@sirena.org.uk>
 <2fd6f05a-6dfe-40c9-a7ad-44c28af8584b@kernel.org>
 <0af7abff-2c33-4920-835f-9c5abe73b143@sirena.org.uk>
 <7ee4f5c9-58cd-4238-be2e-f092acf3c137@kernel.org>
Content-Language: en-US
In-Reply-To: <7ee4f5c9-58cd-4238-be2e-f092acf3c137@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4NiBTYWx0ZWRfX8mKPj4ziocdP
 bdlQvuat97Yo57D1UtecAhlrJbG7q0ZWBr0l9+cYcZr+VG7/2TckpBUC3x3FVFsOd9pGUrRdc8E
 3f468pRGZHJSidWPTKwmdGRB8ifO0W8o7O1JXwuFV7Ps8+P8/COxNKidEwQDIVv2/UzQRCw7N+Z
 MG2z8mZqnkdns0wQOprf7HCg3UPQTpxIgtMcZPtYWtliUytadZOqRJIo046x5L9OzttsCIM7pBb
 qENH4rP0xgzZC5ItpLtNj3hXZsYsy70KKH1QGu/6Rh2zpj+IB5BeAmD6XNVY1M/TPp+j03qi9tW
 oV0y7foaLjC8REV9/MZwLasIqBPxJOQYu5Ci+09l7FGRs9XRUXx8bcbf0dUMjrGOlQMfSB3FuLI
 VXrFNchngXT38rZFI2OhLNyFj1+ZP0wdhl2qSDjW5Wk5dyeWyEL89BBiuLih9LXORsjF8b+7pyU
 0S2Yi38cFNqQjgSQ6oA==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b04b282 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=EbDk/eETi6Q6sYbTlnF7GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yr0mMJ_9gDnwHveZjjMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: IgiaX6A2kqbkWVF4MMhAakJTrJVQ6omw
X-Proofpoint-ORIG-GUID: IgiaX6A2kqbkWVF4MMhAakJTrJVQ6omw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4NiBTYWx0ZWRfXwQwSwvohnZa6
 Ykljh6FXnTMoVaMnz6bamjkNiLJsLFwYKBF9msFo40CYonc+SI/iUPl6NetQr55gzIiV2IGgLyw
 se1cKKrxymTWlfoYFhMc0gf9nrbteRQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230086



On Tue, Nov 24, 2026 at 12:31 AM Krzysztof Kozlowski <krzk@kernel.org> 
wrote:
>
> On 23/11/2026 19:58, Mark Brown wrote:
> > helpful to have better compile test coverage for these drivers to help
> > avoid such issues, the easier it is to get the code built the better.
>
> I'll fix the missing compile test for that driver.
>

Apologies. I didn't build it for allyesconfig. I did uncover this issue 
recently when testing on a different branch where the said driver was 
enabled. I was planning on sending a proper fix along with v9.  There 
were some fresh comments that came up from maintainer Vinod last week [1].

I was planning on doing two things:
1) Fix up the build error when sending v9.
2) Send on top of phy next [2].

I will take care not to let such things happen from next time from my 
end. Sorry for the inconvenience caused.

As per mixing phy and usb patches, I know that usb subsystem prefers not 
mixing up usb patches with others, but in this case, I thought that we 
must send a complete series instead of sending 4 phy patches and then 
sending a separate usb patch marking the dependency on phy patches. In 
that case, I would have had to send usb patch once phy patch was in 
linux next so that no build error would come up when Greg would have 
picked usb patch into his tree. Let me know what is preferable in this case.

In case Vinod is fine with the implementation and comments replied to on 
[1], then this series need not be reverted and the build error can be 
fixed by Sasha's patch sent today [3]. Else, Greg, please do help revert 
the series from usb tree. I will rebase v9 on top of phy next after 
addressing the comments from Vinod.

[1]: 
https://lore.kernel.org/all/6ed0793c-76ce-4d04-af5f-8987311c5c0f@oss.qualcomm.com/
[2]: 
https://lore.kernel.org/all/6851ca2b-775e-44d7-b437-d04fd4ea4f21@oss.qualcomm.com/
[3]: https://lore.kernel.org/all/20261122152857.1113943-1-sashal@kernel.org/

Regards,
Krishna
