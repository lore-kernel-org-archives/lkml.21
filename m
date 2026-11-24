Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795500517;
	b=2chl1yoaCjbPYRqX44akGzI54RnULU/ihUttlr30cwLEa809izVEcTv+QYq2PEhH1Yvw
	 rYOxlu+uRHQUc85ZYs5g5m9LsqDlsS3v+tIRRK3wHp8A0d1SzEtXQNGPfwcVkJHjPYezF
	 kIWS/l+UBjCeY/8rhccab59bCRV4bzNZf0onwIBhUXkoBG552iC8AWy39VcOZ6xs4Sd0C
	 vZvy2vM6DhK7E3qxZ5jopP8mQL2UjpWfdD35Uz5e6XS7tzKsEf6HvIhCkN7CeCr9JWhy1
	 PY7WZM3LJTULA6NIYucBesGjglQDDIYxtajgxosTh9ZCnH6/xQoWGiTyjQAlSEjpHpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795500517;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dvY4KBfiISm+CQm5KIDUrtb6uzBgUaP0PFQaZpqv52w=;
	b=MgEVYZQynkMQUyMKLmdrDShRuOW1KVU8M4bOSRKTIcnAP9E1BuDiDr1Ui4TPxLY5xkTN
	 aa6OKH/24yZoLHJdthTgEA900tFC8SxQrsdEGuk88obTZKRYRCS40MaTK4txOiSfavKyL
	 /zaWOipmiRqSWQdfMXNYwWA2ONwuqMZuHVPwHLD2oXcp01KHA6rE/Es6UV6t9Xb3e6xBC
	 4t1P7pdHBGssArE+4vWVgVJarH441c2+mQkLIpat9nan7bfS8Pdd4GEZE1pxg5NZkHWAQ
	 xMQXb2qZl0+57ppW2ueoAGjP81KEeYuSx/CWKA6yK4HPkfO/+v65H85ieuTPfzykLmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mu+lZvdL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZGO29w+k;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8567C606A327
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8567C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mu+lZvdL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZGO29w+k
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2kA44646316
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dvY4KBfiISm+CQm5KIDUrtb6
	uzBgUaP0PFQaZpqv52w=; b=Mu+lZvdLXuWGpOkRTkHFjM/i3/zxBEn62CaGxwiM
	4QAwVoT9XEi4yAVQyTS/Hdf4oK6g4Bc9UAYdPk+DRdycbrtCTJCG8mMPRAhd8Itr
	YJhqFMUPxIvAUoO28f/gr9kwh8uoUQMFVNIJ4mHntvWYoUNjLLZJkNIL9C5NO8j5
	4wzwAtnHxt9pAGjuHvdm/dL4ZGq7SYRNZIslZ6b/jAPWSWpvoexho/kIjWyCe8Go
	XEM9WzZZfx7YDi8VBJiRGkruQKiQYtAWiuR5g/M2YJX70BEeqYi1vnUAfiYQx25H
	1Q6Q3rvSf1diwPrHavfw3ko6BktLi1o93wWElVUR6hp2Ww==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvd14k9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:08:35 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-92104826f9bso80795796d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795500515; x=1796105315; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dvY4KBfiISm+CQm5KIDUrtb6uzBgUaP0PFQaZpqv52w=;
        b=ZGO29w+kZqFi0IoremOsMtN9bKkizaQT53H8YWFQDHShgC+v74I6+QopxA9VOzR3ag
         vpo8bEUIF8O5RsZIAg/OLAqOKRB/bKTx8+cSCgApxKM12o3xffG44Tb8wjTZkSkRmxCp
         wij9c01WUZzaDr5rVDD1SJT+iGxhVY2DGrilMJockekBI3nIm+ySQCHW9FAgGT1TCkED
         cBg+mmrXK3wzCDdfn6tJ9MkKWiw3B/ZXVhgrV+oDdRaYRTIjpBAkDMZ/VMsXJhU+E1Kt
         SQ9c84H9SufIQJjJDyuIlA/LWh9gOMXMRnrjdxZtJ49QfcTz5Lm9KRTSNNNdk8bu9nwV
         oZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795500515; x=1796105315;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dvY4KBfiISm+CQm5KIDUrtb6uzBgUaP0PFQaZpqv52w=;
        b=UwLD3ZBiC1/I1x//CGSe+T53Ld/YJs3KdVQZilVEifXp/OqNecmUveGyV8LVdp6CyH
         5LD1xlUdPCeoqm0ioLBO358Km1x9XEe8teJgAJeqbirqoyHJC1sSPmPA3LT0KR9wj+Oo
         IYdZXzP+wUKMGAzl4X/N/iXRAAv1cODbBxVvpYRWuYHyGkeWAYPEWxA+L55VzoM4RvVu
         bMNIu0E8UbvbIDydePFbQCZagUhchyXo9Sg5yLRMBo4G8gGdSi9xGT8Dm4p0CSEEKVpy
         3FjE9jWaoCO+ZUoDuSiHlrR7HKt7Ch2ABMTHBnd/t5C8NGyzUe2Ah9dbuOQqFjVxx5yK
         KqbQ==
X-Forwarded-Encrypted: i=1; AL+hErGZO5zPo+eAaQLrYyDGq6g4lpoCHxrO18knUZF/UKz3dhI3zkaDHA2JF77fbzXeKOn7XGkywdsR0ksL4YY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EDcR4k8s2BcDW8TfsTUqEWLpM6IDvPiAzAb7tIZwIG1+b0qxe
	269xqElUMK7E1rdaTIk8lSKyPDEuOmLyrpAFcRZTfNv5OYYKwVayqjJZ1beNx4LBUTrvvy+bJMl
	fK31DDqv2lJIncHRT4K3sMSeMFXS17GtWHJGlTg2SHxhJl8Dy+BgDkkDmA6D7W3SEnj8=
X-Gm-Gg: AZFdTZczLXGP35vGvIdCcJecPO2+EKmwRxJsAelY6VulmlGquTMIMkmQP9P1KIyT0qq
	v5brp4ZMPUnFrWgCbf/4me0yWnF1nitpYZkzi9vBd1LLKvdxdHd4XS7Mq4w0j+2Q0+g100b5Edl
	8oyZinntB0b03TKoCZF3AMKyV1ja7Wf8IWL/nPezuj1gtaCKL1Kjpbiw7nPv8ngBMTTc3CFSeZB
	N8SlYO8Xl/ju9aDN2HOFSaGW1hB4/XgHimFCyVWeg+XHRQUrTLNg7Il/f18ViWx9FWKtYW8OHFT
	lzBUyL0uF6QB8sbGEnq53ae2bCQqPgqxfOJwWbfakY9VXr/7QeRa138G9yQ6RDi06FBfyIHVmP7
	jZOHyg96jRxC6vx4TlX/1AYLclpAk3oJqTUqlQqdZwWklc+mdv0oi8/RsZYz40KE=
X-Received: by 2002:a05:620a:3185:b0:93e:94a4:a97d with SMTP id af79cd13be357-949ba683204mr2433052385a.0.1795500514540;
        Mon, 23 Nov 2026 22:08:34 -0800 (PST)
X-Received: by 2002:a05:620a:3185:b0:93e:94a4:a97d with SMTP id af79cd13be357-949ba683204mr2433050285a.0.1795500514001;
        Mon, 23 Nov 2026 22:08:34 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm23005124f8f.17.2026.11.23.22.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:08:33 -0800 (PST)
Date: Tue, 24 Nov 2026 08:08:29 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>,
        Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
        Dexuan Cui <decui@microsoft.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, Jan Kara <jack@suse.com>,
        Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Ondrej =?utf-8?B?TW9zbsOhxI1law==?= <omosnacek@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Jens Wiklander <jenswi@kernel.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Scott Branden <scott.branden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Richard Cochran <richardcochran@gmail.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kvm@vger.kernel.org, linux-hyperv@vger.kernel.org,
        virtualization@lists.linux.dev, linux-sgx@vger.kernel.org,
        selinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, netdev@vger.kernel.org
Subject: Re: [PATCH 10/14] soc: qcom: rmtfs_mem: convert mmap hook to
 mmap_prepare
Message-ID: <7zkdydihgjnqxerwzbebrcryry37hcqc47dpzqmoxdgc7qt3i6@uanst4lmvvkn>
References: <20261105-late-2026-mmap_prepare-v1-0-c56aadfbab8a@kernel.org>
 <20261105-late-2026-mmap_prepare-v1-10-c56aadfbab8a@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-late-2026-mmap_prepare-v1-10-c56aadfbab8a@kernel.org>
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6b0529e3 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2UNkV1bVvYdQOko7pskA:9 a=CjuIK1q_8ugA:10
 a=QtEvL3ry9E0A:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyNCBTYWx0ZWRfX/i2DKvK0wMOl
 sA/I6b8epKRKGwjSXI7zMmEBXLZ1UygGRssVdRLNZMFj9JjDitNh7eW49DoWgbiVW/IvJdI24AH
 Juy7xdXf9FOqkh9FzmxeGhjQznyREBhV54/BfzB15UhhmmPLZKmdw38LGUCJ+pf0MkHDi2Xz3xY
 725XhYNLvW+nn0E+aHzF2mPPItJmnLcD76SDUa8hrkBtDXlYZc6U8yKrxW0NGWY5LcK1RxA66ci
 JbK6IjWUKRDvMs6KNarPZp/ndhEfxXZdaMjN0OeqClInTdsxTlk5E9pETMkMjmPDx3odvSdbK8i
 XfTb04qGJ6gThTIgtwXqQcWC3lde1uwSEaqNUpso4UQKI8WdQdQVacdBXu5GfR6CUAvfcR+Lh8+
 CATG/oNO016hzf1DiZmsmkl9rW9cR65yfpSljMvlTNs15/X8YrXYACFK27gUOEi3z6Q8hIFty9n
 c/RaZhqC0d5pR+Lbjbg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyNCBTYWx0ZWRfX+z30+WwzyluN
 +RBwzSeOWLDs6KRRx09dAEzgPX2+CO1kbpPslz5ShDCl303zwq8DVpcNpa5pHnNWsc31/wa2DUC
 hYmIbZRX06/ffvxwqjmLeiRIXQjqJaI=
X-Proofpoint-ORIG-GUID: rBR_JQYZ6Vq3vlTu4K0pUKDj-eLhViHT
X-Proofpoint-GUID: rBR_JQYZ6Vq3vlTu4K0pUKDj-eLhViHT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240024

On 26-11-05 21:05:41, Lorenzo Stoakes (ARM) wrote:
> Move from the deprecated mmap hook to the new mmap_prepare hook, using the
> PFN remap mmap action to map the region.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

LGTM, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
