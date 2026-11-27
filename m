Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795790628;
	b=xrjiRPCVcQIpKxT0oVr+pearD/544WgnJKrmGlfF6TRnxs/ozrBYRetJU9mcKOSnEiWk
	 IxbYnIMLxBLP+DJgrPUemBcTFuTdyAe2KR7MaKWMSjuiiZ6WLy8VPLiwqvftmksa2lmix
	 uE5lIvLQupTJD7J7l4xF2LuQXTvKTyAJNPwV8PYfqu1Qzra4m8vbKSC6i6SDeKrlG7G7S
	 hi4NzwWlPOcn88tQj2ASSPRO6cjDGoRKGNrg1mRwgvqA6ffiOn4fa3JungG8XKp3+ZG59
	 hDcxLvzoBNt8G6QAbulYLmmVvfZJOw5MXSzGYcM0XStUYoMuz+4YA+MNS3DpKzxXZGA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790628;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=S1GibcSi8ppb2aibwn9jnQWyPdpPCwtJ3CDbi0G70gY=;
	b=uJclFNDoqARagrdjHVBVoXHuZIP/DTJjCUkm/lAcZOnp237IrkmPB7UUwgczKn0FnBDs
	 2RyuumY2WCk95TAgfcDWfQiMTYPAL+kWlw+/qFQj+hcNX5oo9mkwHvu2EnsyN1ZDyMFwM
	 jiO/aItw679hqEToUVKwABrj6K244D1B/aejAwCETLOO//leKTgi2KyUcNg/XwNzAqJQD
	 KtEBiiDmHRBKFrrMtPtyv5BgbyUA3NCjhKtsHT1DZi046vesV8uxVioXV1kbae0Rs7L9l
	 c5JXIT7pQpRP3unPj3/RiKVgSEezSLskIxj2wwn4gZD9gEdKR4Psqao/iAE9skA4qtw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p1N9tj7O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iwFqb3Wk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A709606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:43:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A709606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p1N9tj7O;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iwFqb3Wk
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1Q5J686141
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:43:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S1GibcSi8ppb2aibwn9jnQWyPdpPCwtJ3CDbi0G70gY=; b=p1N9tj7OkIZ1G7Pi
	uCg15YplP8iczOFLY7h0M0D1C1x8hIhVCnW97uAA7laN4Sbi7jay9LIIVP12R1MC
	fujQ2LaKRCRMFF0P7+hkBgXjloYuncHBxdizzOL1hfBYteifZqQkNAYp2LSC6qYv
	PRI4RGBJUpWPDVG6MZHMsao43P1J2QnJ/bErQqozTORTFTPPxyj8P+l8Bw9O1lY9
	SoZHzAf5GH4QV2UNXOnHh0JZtxTgPUtFVzoT/VyY2OZZhLw3oeoZSmJewIZo8kad
	C9wqvRivDmdfAVTYJ6XdHMl/mILtPMl7LUg3CWuubuR6t8LdCZyZYebuusFkOrZB
	tXDEHg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49bf6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:43:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b505a2bb1cso1933534a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:43:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795790627; cv=none;
        d=google.com; s=arc-20260327;
        b=h5sDlyhPBQ+kKmZRpqUzFijX+sbC4r8EVUVLJi9vt3poQuf9ooEb7rut2r8fhvZgdC
         Q+p3Dm7aAn1vELQN0ypmob5r5tMdmz88DVaDUUQTOoGXZld7by+n5lT3/BlIk4Sqv4/j
         Ko7wh3ftnyzmJWm8ylgfCicXlqTdARHWJbKPSCh/LCbmV86IDAOFELp1LzP0Qnw6VeUr
         sWkJLpuLaBaV/Nnl4oKJLT6G67q3iBmizlR+YT6Vgzw1orCGsfoS3fl0qoqVfIEKni3E
         BlvMQ+ErtjIWfrLk9oAzioP702XYVE71WkKunhQAKYs1a2xfl32nqBQXwEKuGtfnG+aK
         QeOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S1GibcSi8ppb2aibwn9jnQWyPdpPCwtJ3CDbi0G70gY=;
        fh=BV5sNPH5xZgpowT5FFXVQC5Jh8fivJB+bG+5/XNl8xc=;
        b=jSdz+cDL5tAPnIWmAJChyQqTrXE0vOsslzG6+qOIkavP3sVaJk+ZLCPrYv7hrecgYG
         Yss3izEzhBV5jotprP0rPbpHGO5qTix9+QLU6nULfUTIlQwGkxZKnEuD1/jDNQjpc9b3
         y3LdySGRP4XJ79mIXyJnZT/vF2tcFdmYORHP86hINjL8vQNpd+26277jjOb2A6fpVl0I
         3nZDuoLWYg3pTifM2M5vxLNpwhcIsB7LeBgodk766/fosjx4JKZLc0fQnNr9y7QR28gz
         Hr8zrb2xJymC6M5CeeBsvSdAEhcKhsYx5nvAs5lvFRkz7I3MFUAyVrdGIuxf8Q+3W3kI
         ey6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795790627; x=1796395427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S1GibcSi8ppb2aibwn9jnQWyPdpPCwtJ3CDbi0G70gY=;
        b=iwFqb3Wks/14zHk6lGmhA6yG4ZqEl7pHwwPtZCTK55plFb/uyttaDCri+gUGekPgt4
         ueEOPyhdBwUeTLNNR3kGHc0aAIj648dDjUCXhNfP/vi5e47ueWG0TDVK8IHbXNgD5rRX
         Ql/nkXmS/quGeWjW4fsv49P1A3ycs4c2DS78p4CgE9sRn4/lu13TIUZWU10IHxlMzTLm
         0GfqOjOj7Hze4+Vqr4AnNWJWGFigsUgO2nDuSNTDOlOcA+kzcgHCr1lieeaLzHVMblK+
         H2iDItm/En+c0Dj26pvD8mEEClqSht/wWFc0/dYhc1cFy/ZK0CblxwZMZwbTAVafSPBh
         sRwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795790627; x=1796395427;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S1GibcSi8ppb2aibwn9jnQWyPdpPCwtJ3CDbi0G70gY=;
        b=P1h5H/k4zdzmhzgXHJdYju9ZD11/duuIrEGh+O5j36Vie2pLax2p88pxudiQ869p0E
         utMlAz7Bza8gyPsmLDXJm705LxYVbKSSwUwZ8zVVK7PqdrlsM9flWNsSRkXvn5mw594A
         TTWsrEbGMSH1cUbTUt3Hxb7ufZhoC+TOC0B8Uh6by3MaA+XqvPIkkiyUifs9wrqZF1KM
         rFhRxCaKkoUkjnyDPD2EkUY0QQS6/C6r86SUja/qLdWxgCfJZZ7kY+x6LSUh3LCQ+cuZ
         UjjmPUiFJeTKI/peAe5lXnZpH6eGwWcXGVvxsL6r5DT/6P35jiaND0/+KT/7mV7hgCA2
         Lhdg==
X-Forwarded-Encrypted: i=1; AL+hErG2gNg0ddnCP09rgE0p5olo6uvvkAF73h9yRpXDPOcVAHo0g19pHP61ugsxrDr7W/Sq6Rdk6bXzv/yenkU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9K5LL3g1gcoN0z49lwORq4GKqcyQ19aS/SnnIfZWvZQkh5LM3X
	kP3IoTOoKwyJ35XAzhkM4ecM21TzBuqH8zMBrnorEYzqHlFsWtIEcMD26FZc2xSHbMgoxKCKsGL
	oYY5Ya7TDUqwTGmwVSqyqtPjpwmJRfCNK7Qrr+EcHbB2+YFafTTBvM7Wbhkq7VZsxaxqdIr1pfi
	h1qqcfbe57OFayyOccUrpeiUJC3Mxk30v6KzVllUFvnrDoxJQOaw==
X-Gm-Gg: AZFdTZfJWyLMNU/y1R5fJwe8OZwIddebkRXXJPx5wvKanKvG9rar6HHd9RzAoOyc0l0
	K1OXyJhT3Kuy5+xF2izHH4qvVJkNsC459C8NKOlCfH4QQvgxnnvdzcijwRvpkxp+l3Sekv1TliY
	TUWTtgTYMkhEYvZq1zeNeCQ7vtMx3jIZPxP+ZUBUTASImUCI6+pmYEY5yW0Q==
X-Received: by 2002:a17:90b:5303:b0:3b4:41a8:7850 with SMTP id 98e67ed59e1d1-3b441a87c7bmr20310205a91.6.1795790627013;
        Fri, 27 Nov 2026 06:43:47 -0800 (PST)
X-Received: by 2002:a17:90b:5303:b0:3b4:41a8:7850 with SMTP id
 98e67ed59e1d1-3b441a87c7bmr20310177a91.6.1795790626540; Fri, 27 Nov 2026
 06:43:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104080705.103689-1-zhuling2709@phytium.com.cn>
In-Reply-To: <20261104080705.103689-1-zhuling2709@phytium.com.cn>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:43:35 +0100
X-Gm-Features: Aa3M54pZ3frAVHJJ2Jd1_S4cQQq7Xtfe5OZdhfiLiioy0IL2PJC7Snx3dAI1u6w
Message-ID: <CAPx+jO9FhaDrZSvKCQHFsra44_gXBoZ5Z4Zs9ouhRLDYX43QZw@mail.gmail.com>
Subject: Re: [PATCH] mmc: block: Mark the end of a truncated scatterlist
To: Zhu Ling <zhuling2709@phytium.com.cn>
Cc: ulfh@kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        fengjun@phytium.com.cn, wangyinfeng@phytium.com.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: -xYx-R3PlIjk1eMRM_YqQ78yAkliEBxG
X-Proofpoint-ORIG-GUID: -xYx-R3PlIjk1eMRM_YqQ78yAkliEBxG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1OCBTYWx0ZWRfX/ebEzdj1fFXz
 WPQZXV8X1RqdxXp53aqLdwvLqYKB8h+hlX+Hz2+fBZZNATYry6CGY86xBqEehBIr+VRmMHxjMvN
 B2uEi3wOzR+BLgGWDa2q2guI8ecq2wY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1OCBTYWx0ZWRfX1C2KaC/1Gc15
 H+ozKNLgg8WlcY8naGOkzQ/7mWMavXgxHAOoKvLPEGUhpp9VkWJNgea9vbROb29PxRpAcoLSOgi
 GZ30obEYlh90AJDjGo4TmGlTVlaL4gmcB7Ttbcqb1UZY/yMNtiu7aTkTbhip2uWI3dovw9HOYmJ
 6Q8ZdDJPBOD7tj3RcmGeklNc87AprbClucylt9IwuNRMqtzXol/hmZVmpA4XDh7Zc4T2mVSPmcB
 CxXb3KKtqJ+C9k8zpETMH3BQP6W4cEo9J19k8sSLiTvJGHT5lOMMPHWntS4vnQSjnfI8Um99vW/
 mBttzKfvGgKgu2oKs/geOM7Iib+PW/WWWdP9BNc6Vn33TMUaYbTW77a8uN5rTbTzGJ+AA16erRk
 BFWDmUZeShlm1+l2qYnaf5BLD9/jw1R60YqnJT4BFoFSuISrfkjBqHpSPMpOLKRoqfxiMTmgX99
 J0QU/I9gYmJkxnAZYyA==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b099723 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=fgrLqfBXAAAA:8 a=Pjbyl_n4pQ3aC6MkrpwA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=_Ge82aPy-h_wFa7gWU4u:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270058

On Wed, Nov 4, 2026 at 9:07=E2=80=AFAM Zhu Ling <zhuling2709@phytium.com.cn=
> wrote:
>
> mmc_blk_data_prep() maps the remaining block request before trimming the
> scatterlist to the size of the current transfer, for example during
> single-block error recovery.
>
> When the transfer needs fewer SG entries, the trimming updates sg_len and
> the length of the final retained entry but leaves SG_END on the original
> last entry. A host calling sg_last(data->sg, data->sg_len) on this list
> will hit its end-marker assertion.
>
> This assertion was reported during read recovery with a Phytium host
> driver in a vendor Linux 6.6 kernel. The same trimming logic is present i=
n
> mainline.
>
> Mark the final retained entry as the end of the scatterlist. Subsequent
> blk_rq_map_sg() calls can still extend the list: blk_next_sg() clears
> premature end markers before advancing to the next entry.
>
> Fixes: 6a79e391df29 ("mmc_block: ensure all sectors that do not have erro=
rs are read")
> Signed-off-by: Zhu Ling <zhuling2709@phytium.com.cn>

I am surprised that this hasn't been reported before, but the patch
looks correct to me. So applied for fixes and by adding a stable tag,
thanks!

Kind regards
Uffe


> ---
> 1. I could not find an MMC-specific statement explicitly permitting an
>    unterminated SG prefix. Feedback from MMC maintainers on this
>    interpretation would be appreciated.
>
> 2. bcm2835_prepare_dma() checks sg_is_last() before dma_map_sg().
>    No failure has been reproduced with that driver.
>
> 3. A userspace metadata reproducer triggers the sg_last() assertion with
>    the original trimming loop. With this change, 120 flat-SG cases and
>    36 chained-SG cases pass, including truncation boundaries and rebuildi=
ng
>    a longer list.
>
>  drivers/mmc/core/block.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
> --- a/drivers/mmc/core/block.c
> +++ b/drivers/mmc/core/block.c
> @@ -1506,6 +1506,7 @@
>                         data_size -=3D sg->length;
>                         if (data_size <=3D 0) {
>                                 sg->length +=3D data_size;
> +                               sg_mark_end(sg);
>                                 i++;
>                                 break;
>                         }
>
