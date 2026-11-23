Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443818;
	b=LkP2biRGS3KIZe+Pes/jJelIYhVzh290eZYmzI86p7UoTRpEIcGwN6A9Ncl4gO2oiw0d
	 Ib9ayMsA0Pj2lBhqh7bO+WBurLiWeyeIUHDxI4e7dzaCOF2l19vfLkNFglB8yzgo1yVUg
	 rHyaLFo714bHqhackPoRUMKVfdXAUB/ZTxCqGt5JQIAWnNRjJyePssw14jSP1vGJT9gWp
	 FsyJcGKRxSFaeMmKVz/oy086noVqkK7nY+BrqCB1Yvr4WDy8mJvc+wpYQcqKnQNegWsF2
	 XiSVxsMergcgmWkGyJud0IrILURi/CmNFwwJBbtL6jR7vEmXbkwDuyilW0WruMM93NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443818;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=R58ul7daVrn07krrAeNAc60Og8KzeZSAiSeUftpLzxU=;
	b=t2TfOlp4aoPmz5AYDkdJHyBg+JrjrgEDhri/OSSInMd/5ILB+Mh7Pfrcfu015/Sx67vI
	 /w/fufmqh/ucGTY/wBwykx5MS5ltkTfeOKeb09rIPweFu7dIRvKiOhQrNPICzrLu46xV4
	 8FaeqmdgBz4aHIaobmgG9j2/4BuUepepxNc4HhYRw38fhqeu8m/aJdPPNGxiopkSj0wfR
	 leHDSlH7xUnkjxjSAHxUO4TSGap2nCQQiet8t/jGOPW9HnWwsaPoXkYamzwPg76tWwLTW
	 WL8akAf3mMwM5YxGwioFQ9ZnSsLfgupUFO37pgXurSF5/qEm7hFhIfB5aUlk25qzncA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C670lo1s;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YDKdO1qD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112D1606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:23:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 112D1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C670lo1s;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YDKdO1qD
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKxuO2442745
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R58ul7daVrn07krrAeNAc60Og8KzeZSAiSeUftpLzxU=; b=C670lo1sjQfFVXfY
	xd1XybvDWPzhoF1dqWUngyLaarzu48aTnave5Nv0tSoFrJLzJZO8nUOiKAsNYyde
	kRlAfCVOJK7oiDkr+jPJOtRf0QceJmjaTZWHGI/r6ErcUl7NvQxSOMdpAoVr+eA8
	sMdAQkJaxi266gmvbLoXDwBrmcA6j3I2aFwrbCTy8eCvLBPkRpwWERGgicO/mr+d
	I4xCMqD8iYejyjkEkJjZpFOlxlI6qKmsr35ThunV61PYisFzxyChFYrZWN4lFeW5
	kNdM1/Dh7iBk/fojGNGAWqFUIMPk13ZsS7FGFSuKJ47pmwJ8dL0imMfZj0V0diWY
	rtcAVA==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1k1sn0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:23:36 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-67994567a44so4661133d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795443816; x=1796048616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R58ul7daVrn07krrAeNAc60Og8KzeZSAiSeUftpLzxU=;
        b=YDKdO1qDoSyuPV3v1reDrnbo83Ns2UvT6rtTPrjmu0ABJQJJOXdwwIP1U1Iic8ZLRT
         +rckq/SsRoz8x9MWqBaJZ8ieCFA111xO4+0ZFzRdnGk5DzGLlQipb6WaFANES4Oaed4j
         kS8BRYPCJAKnwEn8fWbdTcRS+DoFSi+PRk+XXq9/ECtzyU7vd3o14E6uBQO+vUlLUEBk
         HFHsOMDpKQA+O4JmSVdROxRRksyprXPPmemeXndj08vP7xUQCnWyO3WGDQZekofpMTPo
         3vNj13u5D6NVNA0fnJ+xrNAkuJMxa71NTkRrYtOSpbshKjy4CHEOHPuWtu3OihESiTew
         o2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443816; x=1796048616;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R58ul7daVrn07krrAeNAc60Og8KzeZSAiSeUftpLzxU=;
        b=QMlYMIMbVTq+58J/6CgHmmT98xsqRnmE+soYzYngWkecNQ40yVxiOoxQuxVESKCFyr
         a47pbRLT2Qsx6t4D6AJ4s+6FItxL6jphr5aDMSM1HYHei5jirjaXKkAgI6V/wbGvi24T
         FIScAe95Acw4oWnKiDujX13l5mZIB9j/Z6DYHO+kjYPI4+19DGAqIXK4keZCxQBtnQDt
         7Vms2WGO2ZVhWDR90TvM6ybE6XBbR90FlkrwLXWfgW0tzt2y7BmOUuhAkjXLKWO8IM/S
         laKrmX2nIRqfnARAnI8WdmLuaCGJMwiC2CfgMHA8SSYW629sUv3FPSwFFh4B9f+nNFf1
         QDww==
X-Gm-Message-State: APuU4Z+VTtloCUC8x591Kz4KD174MEb9k1u2RPqXMc9dEsayszxzTbvr
	j2KJPReeUBfz9wdwhsckTvYagReW5GGrQP4TBrzsI2F4ejiOZKxqIa4slaywbrOuThnKieKmIx0
	3Mv7OMf/TDlx/2uzzGQZRmppgvtoN33GyRtIx/csmPGjPh/R72shXWBYplo8lurP0u20bN+pWkx
	A=
X-Gm-Gg: AZFdTZd1TzCLJ158kqcRZWd8RbcW33HalRB1r+IeHJOnYOpOgu3GQ5B9PS7VfvxqlMk
	NOx20L1/CC5sV8pr0I4L63fHB7WdLUV4dIvhskMA2osCzYSJ8c05i0teQNUX8XHOEbxHmw1Fwdz
	4vm6sRbsl22G697ONPmcTmYZ2bE7s25cM+3oaRdbj5UJreAzw/oFr2Cvnae9xezRqXw0BAXZLua
	n841cc0je/eNVE6plTbuKprrGULZI6MgDoBUhuTREWZb7okMCJ7I7c/h5mmVWC+UTlizYE7KlSD
	4zBODPXV6YoJTUhkExTR+jfvK29b6Ex6GjpJDUWbtl8Qp2aZZqcqN3kQfZsh8ni/myUxnBfOmiQ
	BxdDOan9kM9iQmOSkwhnQQ2q8e9EnVggh4U0pcnMupkg6PUjJETK92yvYLuxSOJsNIvzz6n2b9t
	kYlhQUkMaqDZYckd3SzFeHSRWSk1TYqsRH1XQPl5DhqnQ/2HSHyzt6T0h68qy3CA==
X-Received: by 2002:a05:690e:444:b0:67d:ea44:ef04 with SMTP id 956f58d0204a3-67df44871e7mr3576917d50.94.1795443816361;
        Mon, 23 Nov 2026 06:23:36 -0800 (PST)
X-Received: by 2002:a05:690e:444:b0:67d:ea44:ef04 with SMTP id 956f58d0204a3-67df44871e7mr3576904d50.94.1795443815699;
        Mon, 23 Nov 2026 06:23:35 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm22145368f8f.10.2026.11.23.06.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:23:34 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Jim Cromie <jim.cromie@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-gpio@vger.kernel.org,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v2] chardev: GPIO common access methods: repair non-kernel-doc comment
Date: Mon, 23 Nov 2026 15:23:32 +0100
Message-ID: <179544374364.72405.3233920081843026528.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123004501.1771603-1-rdunlap@infradead.org>
References: <20261123004501.1771603-1-rdunlap@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1NyBTYWx0ZWRfX4jyiXc+ekRpk
 aHbFBCPLaFN3mbcq+F6Lh+aZkqMl/n2jBrdWQqv0ZIiAX4kyvomilk8UuF6GblsCFLDj1xhWKUK
 0mXEYWZFqVYbvempUZWkHFqRzFFi58M=
X-Proofpoint-GUID: 6yTDoy1EEN9oCnVtj9vmm8Vwj6YfmOhp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1NyBTYWx0ZWRfX2tsiQSl67V0Z
 TNo1GJdK/EXx0vzSAcrhrjCAYjUympFQpm9aphcRMAVpDymF/L/hP7WBv11fcFz0UMP65ZQOCDO
 jYTfu3mbjQsxlXsczkjldvU3qU+H5+qAzA42XovHQP/RuRZhSK3zpIsf2ssM4P2VqD1dfj1i2dH
 NfUXIjCfXgtYlqHQL8vCrOWx4cVVgeKZsXzvbelzSfhwJBw2NChhf3OQiXBppCZfZS4eh9mAR1c
 8XZfvPtb4cUGLCv7OWsrcJBPLonE3lb7wjHx5ZqUglKw6Se0HDSLi7YoWJ3iQeIuor1AVdunnR7
 HK3HJbTpkj5rfLMeCKkH8oIHXo492UCHgktr9OIcPSmemfoqwHu4lXyYwVWWtL6IE06Uhk2Bgxv
 s2aIcki8pE7jNyBBiVWWUfYA/Bx1IXQNRpFFggb8AmdIZIythfVbdd3UV/P5yzKY3BJZGg98Uzj
 kAKgD83w04NONFAJzTg==
X-Proofpoint-ORIG-GUID: 6yTDoy1EEN9oCnVtj9vmm8Vwj6YfmOhp
X-Authority-Analysis: v=2.4 cv=cpIOAF4i c=1 sm=1 tr=0 ts=6b044c68 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=noYIMVpM_wRd8bws4kAA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230057


On Sun, 22 Nov 2026 16:45:01 -0800, Randy Dunlap wrote:
> Change a "/**" non-kernel-doc comment to a plain C comment "/*"
> to avoid 21 warnings like these:
> 
> Warning: ./include/linux/nsc_gpio.h:2 Cannot find identifier on line:
>    nsc_gpio.c
> Warning: ./include/linux/nsc_gpio.h:4 Cannot find identifier on line:
>    National Semiconductor GPIO common access methods.
> Warning: ./include/linux/nsc_gpio.h:6 Cannot find identifier on line:
>    struct nsc_gpio_ops abstracts the low-level access
> 
> [...]

So this isn't really a header for a GPIOLIB-based driver and technically
outside of my jurisdiction but it's also not seen any changes for 20 years so
let me take it and see if anyone yells.

[1/1] chardev: GPIO common access methods: repair non-kernel-doc comment
      https://git.kernel.org/brgl/c/d4dc896fa2bdfd7d1a78911598a0fa3e3c831d92

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
