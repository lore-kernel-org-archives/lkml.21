Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795505879;
	b=epBNz9+8RFu/uums2+sd4QdeVRuj899cgsqYmF3ANYlCe90heJi14h1SFSf3DsMsg1D2
	 uXu4/mng9R9MSl8UCoiAOiTyhNZHrKVFk/E7jYU4WjJbYgaxceDOsBc0E74A61LTtyud3
	 gxzJ02DyNREK4oAgErswyM0Zn2S80TirrxDX9O1PUT5SHUxC2tr0fkhGOWCFr4jAXvOOD
	 IuMsCko6+FhnrmrRtY3mGfncsadC1nt6TomHpO6hHVWxBjXofp1gQL8S4nNojuTI+XgxH
	 F1qVMPKCxOSduWgTFzrQHBcejX33tV3bwrnJ4RarKvvENjT8AUAiTvomp7Wy8xHXW1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505879;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WLDBCseQttjsh+YgjaRZ95arQzmquJXtwPce4pg+uuw=;
	b=0YrDXOv5b1xNDU7Nt3tsPCF8d4XdHYswmNCNNUyPyfmq+lk0maLWfOR2Y+oKclwGO7Cp
	 +kYWArsqGvC6YmWXOK0g+CUGJM7KP35cO3DVnMab4gv5QjGSLYc2ytC0jfKmdww92HaMR
	 9xb3E/eGruT8cEOcSPQRbrX4JHJKqS2rc9KmAUmQzFewe2N5SOWvc/CXlSKdy12FHGVP3
	 Ri4pkKiObi895c2of92Q/t1mNu4mmJt5AK9iBfAYOMMW39rmEidYhR2IumXVdgmzJn1J/
	 5b/+ziZ2k7pz6JiZLL2rPCEuDqT9pL2RbRjTHrK/J/bf8DjxqH4JckxmLZFFu+jC+aA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jB2OhFnb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S1+Iax5U;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FB0606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25FB0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jB2OhFnb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S1+Iax5U
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2k6Qw3225388
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WLDBCseQttjsh+YgjaRZ95arQzmquJXtwPce4pg+uuw=; b=jB2OhFnb5kcQJfBh
	9PooZCIYHGNUVjDcGwumXONQT2rphRiM+HKb+Z5rBcfoZ9URBb6HmUCKyU398p1z
	0DE3n1unAJCPGSKA9qHqDKxoWrwnFiNfWRaB4F0mZuQ+gIyw7qVkk0rFFWIT+hr0
	xlGvD+nbKD4m1GM6eRm0zn5N+zABS6NWAAQ4zM+xLUUTfkXPLcKrmGNQSuaj6NVk
	LSMFCUkYtOrVzKgsE9JjRJp/p/+NgBxqv/l5UGfpSyCfsEnsySH6HhHWtAFvnFTH
	QiJHfUK8nig+0y+RvbrdRu8nHxWlPz45JWmVSfVxj87VvZ9rM/3qatNGi8g/YvkN
	LVZ85g==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4x8f1sjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:37:56 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b50256700cso64738067b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:37:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795505875; cv=none;
        d=google.com; s=arc-20260327;
        b=LtSlNoNiiNh81Krgh3euuTYhuvOuEnEdeUhFFPNYpuwnF4kTzNzG/AVd/glEnPrJxr
         Y+8KJvm02s4J2ZRo0Tdg9p9nihHFmYV/4zu3Rt6MjqR6w9Xu+jjwEz9jnEpMRCSoeH/s
         5iN9B994+yube6817Vfrayx5VlbR+z8EXv8aPZ+SEKOnG+bGBrkwbhAO5WTigLwfaXlQ
         ATGpy+gxi7xcOuNYOuAbebZrPavl1wwVFKyTbEjlRzHgk1MXNTURqAO5BxXcBiMRD8B8
         lVcvf3w/qka3epqXOP3aDsJ0M5EWzkwNOie4SLtxS2kIEUMvQ5jMjcR75L4uLSPGms+e
         DmBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WLDBCseQttjsh+YgjaRZ95arQzmquJXtwPce4pg+uuw=;
        fh=ohQKvKzH6dkU2b6CCBWfmEOeS/DOqnqglKggxe6RN6U=;
        b=Q7eubgJ+qi+ytce6Gr5E97NaWfJ1hRmj8QBugLgl6OKKoczzPWh0OHZaCIaDK8p3AH
         nOUIo9v9nkh3JS8Sv7TeKoywS6e6FNcGUj0fh6c7kC2+gpuBgi2ij4GjSt6gppih+8ER
         O/FcH3Xi5DogUk9+DOgZ4eYcfIGpYwmLMSgMnyCqZ7ACA5Mtn/FkwHNgjR8gMKN/rIxe
         q86eyKzJJ4Bqcvx06gJ4OeZkEX/4MKi5XILT2EBvUc/ODS5daHQD4S+XDjTTRnZm3vdq
         j21L5+LeiC4cybOyoXjCt/TdYNC2IuR9VKBtXrj3sVU3dfnqlyMvc2NlbkwOTBnsYmuu
         6luA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795505875; x=1796110675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WLDBCseQttjsh+YgjaRZ95arQzmquJXtwPce4pg+uuw=;
        b=S1+Iax5UjwdrBfjmC61+6GR7Ef9vLvndZMhbV6RF5f5jjGfM0fKOFIGSb9cZxbE499
         ufQ0Iw9iW/MkroytuRNTzxKljpJElsFF8w9uRLGP7Avq+RZTb57Ul1XAJRZ5qQA1kqxg
         7jbG878tFdG6DzFw+/37L1jhd6FV1aCc7/cXrp+cfOfsQhmbgR+jpkWB2+0CyWhWN8/h
         yrF5TtN9QZy1tEKAfvOEpPuv5AnxPa6u6OCgoeLhGxjDwK43OfnV/PUQdhSEXPtDxnYS
         FFlkC6lp8vy68Kr1OCdhQERS5xVbG1XGyggIdSHRH/KZmZy1PSroQztV131DD4SIsduA
         xQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795505875; x=1796110675;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WLDBCseQttjsh+YgjaRZ95arQzmquJXtwPce4pg+uuw=;
        b=p/+T8aNOudwbicrPae2IiyueTogmi8Ss1B4wPFVFOpe/wY7wy+AtWCKHAyN1YQxKNK
         +A2zCZjd660z09drc3jtvl5oCk7tB8qQ/7zoT3vvJLldtHfGqindVOEPQh4tdaFJiyn3
         xZau02N2dPXn+NO0xUSJQ8a5gnOz8wvyl3tTBFk1K2KRwgmpOzC9tfiuDycloIfbEblX
         /7Lwikn5kMKxysWnyb2GrPCpljmlBTa0+5fZSZ8n+hMYGkHs/aRIB19x/mWC36F1LHB5
         E5eU2j/eo+XFq3+wyGiSCEOodluy6BBU8Kp2UWoHvd9xRcAzsPnO+KDe0xkABfg3NQxD
         Y7DA==
X-Forwarded-Encrypted: i=1; AL+hErE0uljdoyl4eu+plEyUhh3iwSvboGIDzldj72+QqFu5YgPsifCvf/G00fhzGu4bCl/Cj/Dgby9nmvkZtLE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Zo3Xk45XyHcTjM7nwjOLpH3Nf8oriolvCZER33XJGN4GfYmjy
	LPt24fBMauF2sRWJWbZH8gCbQG6pJy/xw7NZT0R0eCeav6GoNEUEnMrj2M8qru6G60k6VndHt3V
	XWHZFkayisauz0BpFb3y86f7jqjpI1iG/vDbsRAkGdg3NAFlOdcHHJ32SWPwoXPXt9g+0sJvzwp
	ED+NYYKBOKIfkntWT2zL00U8Ij2h6/+zz+ZUypVXbvyw==
X-Gm-Gg: AZFdTZe05XyMSeBR72BzWK5RUeZpvfLcEI6aFc8I/fp4kd0cqOXRtn378FM9MJex/yR
	LtuQmMRUtY7DoP8V6W3opddU3S9ZDLdjDRh1Sipht4VWAMD8LF6Vw++OHCMu3igvDWhQqzCgM+2
	m+GU5ObS248aVrZ9mptUv3fSU771GugR0Ibs6li6a5m8BFtq5zl72qnSMWXpnm8fqv0WDgbGeqZ
	vIhIeBSg4sO4KwgMgWBNbbqng/Cwpwd0cxLcnUB
X-Received: by 2002:a05:690e:450d:10b0:677:cbfc:be28 with SMTP id 956f58d0204a3-67df447c2b9mr2926914d50.75.1795505875020;
        Mon, 23 Nov 2026 23:37:55 -0800 (PST)
X-Received: by 2002:a05:690e:450d:10b0:677:cbfc:be28 with SMTP id
 956f58d0204a3-67df447c2b9mr2926857d50.75.1795505874551; Mon, 23 Nov 2026
 23:37:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-late-2026-mmap_prepare-v1-0-c56aadfbab8a@kernel.org> <20261105-late-2026-mmap_prepare-v1-11-c56aadfbab8a@kernel.org>
In-Reply-To: <20261105-late-2026-mmap_prepare-v1-11-c56aadfbab8a@kernel.org>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 08:37:43 +0100
X-Gm-Features: Aa3M54q5vxZ2pH5GHxV6_gcu1Tnc83EBXhtYw1pJ9H77Fl7U3CQoqAKpEumRrbk
Message-ID: <CAGgiveX=Z5gS7iJWBanyysVUStDRbgTnVktQwJySXw_-xL+sUA@mail.gmail.com>
Subject: Re: [PATCH 11/14] tee: convert shm mmap hook to mmap_prepare
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
        =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, Jan Kara <jack@suse.com>,
        Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>,
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzMCBTYWx0ZWRfX/c8i9RJ3e8x2
 Le8BeNOs5zWKhb9ul0GM2Ruy84eWJQ/NVYxq3KFtXKV2ewFAyV+uPEYlfjzsGGDesmVXAUaQIHg
 I18QMvQLTv3Hsmqjzp4C0cKe+qkFx3k=
X-Authority-Analysis: v=2.4 cv=JbgpPkKV c=1 sm=1 tr=0 ts=6b053ed4 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=97S62Xg_vF6B0O42EdoA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: o5c53c2kwnrYgs_Gf1vmflipDDMvjD9D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzMCBTYWx0ZWRfXxCoLziJxhgCq
 JuHpSxKxzGfBejoNUgPLImfRbb57nspEAYQi1CLEdlN9BfXCtyvsNhOyDAoiGoyTwO4yjbqZpQG
 qqMhcZxGXSIIYCk0qpoJ1QqUXFCWDKRlE9z7pX9/qsyVLA4oPOociC+k/IQ7RIUVDSfW3EC+dEU
 kFbXmgNSswAjHT2SEj1POO148q/UdJIbgmi5MW4wy9PKhcLpTfw2bB9dHIF2As6C9ouwDXpArpU
 7N0qn7b2FMA7Kk2FmmV14IYcECJfJXiSd37sG6G4B0WZxVdBnfVDX62oV5JHKAyMbfmmZ/svHEk
 bOLBwtj7Uykm2TPxr52FY6QdHhW3/+qsdF6/EH6AXV8nPiUYObcecoL4lpcJFkMiv/Xk/B714q/
 ggWW+65JP+5U1mctZIwA+lXg7KtuwxP7wwS6z7iw2OaYgCcoEpYU/bKcTxVSqSpsFMe47/6oRWS
 Hkiq2PFTevdh5C1vT2w==
X-Proofpoint-ORIG-GUID: o5c53c2kwnrYgs_Gf1vmflipDDMvjD9D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240030

On Thu, Nov 5, 2026 at 10:08=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> Move from the deprecated mmap hook to the new mmap_prepare hook, using th=
e
> PFN remap mmap action to map the shared memory.
>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  drivers/tee/tee_shm.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Jens Wiklander <jens.wiklander@oss.qualcomm.com>

Thanks,
Jens

>
> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> index daa4af1e089e..8fcbf0232aeb 100644
> --- a/drivers/tee/tee_shm.c
> +++ b/drivers/tee/tee_shm.c
> @@ -567,10 +567,9 @@ static int tee_shm_fop_release(struct inode *inode, =
struct file *filp)
>         return 0;
>  }
>
> -static int tee_shm_fop_mmap(struct file *filp, struct vm_area_struct *vm=
a)
> +static int tee_shm_fop_mmap_prepare(struct vm_area_desc *desc)
>  {
> -       struct tee_shm *shm =3D filp->private_data;
> -       size_t size =3D vma->vm_end - vma->vm_start;
> +       struct tee_shm *shm =3D desc->file->private_data;
>
>         /* Refuse sharing shared memory provided by application */
>         if (shm->flags & TEE_SHM_USER_MAPPED)
> @@ -580,17 +579,18 @@ static int tee_shm_fop_mmap(struct file *filp, stru=
ct vm_area_struct *vma)
>                 return -EINVAL;
>
>         /* check for overflowing the buffer's size */
> -       if (vma->vm_pgoff + vma_pages(vma) > shm->size >> PAGE_SHIFT)
> +       if (desc->pgoff + vma_desc_pages(desc) > shm->size >> PAGE_SHIFT)
>                 return -EINVAL;
>
> -       return remap_pfn_range(vma, vma->vm_start, shm->paddr >> PAGE_SHI=
FT,
> -                              size, vma->vm_page_prot);
> +       mmap_action_remap_full(desc, shm->paddr >> PAGE_SHIFT);
> +
> +       return 0;
>  }
>
>  static const struct file_operations tee_shm_fops =3D {
>         .owner =3D THIS_MODULE,
>         .release =3D tee_shm_fop_release,
> -       .mmap =3D tee_shm_fop_mmap,
> +       .mmap_prepare =3D tee_shm_fop_mmap_prepare,
>  };
>
>  /**
>
> --
> 2.56.0
>
