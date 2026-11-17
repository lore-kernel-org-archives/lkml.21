Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938361;
	b=rdidhe2dkcakKbOPt7ASw5PpT0JLnpzv2rZbwbOV1LDIVOZn8FkhVOyci3YCk8HuAcc6
	 /Jq9+qVONOGXUpYEwpbhAqRuQvfIR/bzsXvOlW8US2UDVitU+EIY4i9P6aBcxjxFtSQky
	 QmVVMDZXQxqlvGSmbim5l3WHBBDC06fjyh0rtxtSp8b/gu9WXK1dwr1wpbniyc6ziv8MI
	 WGnYVNpeyvyHjkBGytxwyMgH82u/8y4EQxTHNS9lbWDTamE/TbAH8RBjd7g8Mc7bgVQMH
	 VzdvglXKPSWJCyz2tDwjtUPJPISjh6GqzIhAi0A5LXi4w3AVX3jV+gvfwVe9QHRMYEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938361;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hdpv+Cv7ZBNO9I+6HoT8nAyHfxPrhmzzO1euuczH44Q=;
	b=nt0+dp+6Bxyh05w3mDHDPaM5hBbO0MPeSd0Ccs1E5HN39btpJSG0d0C6h5Se49kEdB6f
	 cJi9EFpIz0Bsq8ohRYlFHnYm75CNU77eh26/V/NzelukEN3yS9s3XJmrhTM7Bc3M6wFxm
	 j8kl7/CqUmNCjSQ+CfvaNbAi6Pb7aiv3ym9tBoR3NemKAtK0vJxIiRtZp4iqSLD3qKe0Q
	 g3vjbzEJLEizKB/eYU406eskWNfNfFaPcNxlQgMnyOCUU9WFC0GCo3dgpyLa2eZmWXvbq
	 04ZSQBS5MeaY9ruN/AXQcFaBHw3ZHPf97ctjpdMW/REaz84v3ATJ3EhCOMyf42RIUpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KiPNgY+X;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g20TFLOq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A816606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A816606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KiPNgY+X;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g20TFLOq
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFR32o3503929
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hdpv+Cv7ZBNO9I+6HoT8nAyHfxPrhmzzO1euuczH44Q=; b=KiPNgY+Xq9K21SfG
	3fEjB3drWi6zzyoIewogFQngiovoqU1eAPHtWcBNUcIOI1CJxijS+OqteJSXGH4X
	7Ol9r37XWjuXJJOBklZdN0Rpq3TR0W3GUwZuj6pCyq6uzPNYQ5j1NsCkxRIiJGVp
	fd56/G/DzgaT+NMgxUyrJgCZFskprYRmn4V/GgJYS96FkA3jLw0/KtDOsq1bcdgV
	F+fIfcKAniBqrtp47eWpCcmPa35HQHbMb0mk5f1YedxGzJFM251S9009BWSkuznY
	ZfrBueT9A4ZsJF6guzd+FcsEuXInbXHfYLdQ9V8/K3pqVVWlYKX5hirQ2KgrWuN6
	tpY0hA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0mv1206k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:59:19 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-370230d93efso422047eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794938359; x=1795543159; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hdpv+Cv7ZBNO9I+6HoT8nAyHfxPrhmzzO1euuczH44Q=;
        b=g20TFLOqUgj0sLIuQzrZFjgFVlFliD8xq+NZd0SmsR8+5gGL0pea6C/blAKTsA3aSi
         ySVO7uoKYnIYb+aYQGSB8UiIV6d/Ug3ejoTbXHdpmZmTFy5gx7VeeIxSGP2PinfdXxG1
         BLsBjeSaO4yIn3Uz1sOTwSk6t+7p/UHHxzUlMhjbB+BEjOdADiMVtbU3X7/qjYAQYzvT
         Kt0JEyW1rR6sb9Pq2RrhrPfFuMvlLzIRkaAvJY/qaAJXqc5A30YbuFu3/6IqHvcAGwnX
         i+fPxBmw9dH3V+niooUKrlWzDxPf+BqG621wW7N1VjHVzApkVHS6PfzdVv5/vi1CtmUI
         aIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794938359; x=1795543159;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hdpv+Cv7ZBNO9I+6HoT8nAyHfxPrhmzzO1euuczH44Q=;
        b=2E/xhHdGo9Et8pIc+x6vRPQMSfJBlOni441nTG1BDafPO1KH/Wwt938e1Zr9U/XSSA
         lo5xM6e/wR2fKcHmQM/OGE4CUnR1RMCPGpNAggmcGoJrhaPPN2kBTJgMU6PXZMDDRsqq
         a5gXjOFvKxWwFzOKWeOo8K9fv0aDQnz/qOdtclkC0ifJ38x2f7nurP1lKohiPo7Zi24R
         bzRFQShWuvjOFV2pjz5coPlMl3v4nDvjMVQh83Xf3Ly24VpH2nU/3P6M7eyhLGy9whlP
         8/Bm9zLOREoArd6hyG1h0K5C7OzJklgR8SicwgAmCIc3vrGT1D/6GhrejfVDOvwL7/Ts
         JcAw==
X-Forwarded-Encrypted: i=1; AL+hErGkTZQeFpDJVwIbupCR6P6FOvSMsCC9uTLEoFSMeTSxhUEnBQZYnELH6fLA4Mi1tIx6kWSvNOSYTEheXeg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KeOc+z9A/SMuwJLzKwe/YUMfQakticq32+0KzsdJgb5du/f09
	eeTRDI2HfZAPcU58wN1Hf138/AjF+uL5xinuFYobgC40WLu01yw4zZRuslu2YvCOUYybG/j8CtG
	FL56Gqj76bMQOocYEqMF+r5eub7qe7tTk7RAnoENqsueSrJ8S113vIClXUdNaE5SoKIU=
X-Gm-Gg: AZFdTZfoqv7y79uBRTWR6vSP5recVdO11dz3kPiU5VJ+h5r6V2j/AbUxWDZJd7sv7JS
	e/7s8VfuRCc+vp41/US5RS7Zn2lt+J4j76670nA1qryGH9GyNQeFxwWbyk0GycPECh1WyroAhso
	wD1uwg1in4s7GrOVaMEFm9WWlnsOrZSoIuIfpHgp1JCvRyyDpX/VHHPsbdxPTcL0sxc/G8mGzVF
	au6xgfDs9VI2tekD9X6KUmyUikz665UxwFTv9T3nkCKg9uAcFgJ6hKUzpM11SGjdh9WpMOuVrBo
	RGcxjEoWr8fpPy5yH1FudM4GegOgm5kIvQQyVb88qy8SInMI8njRqGTZKXwj0CZfPm1NH+JJUUA
	sOn4AGFNbXF8dFSY7SoYRUYn0oGvhf+dbZenPeeANRvzmclYfQOvCYA==
X-Received: by 2002:a05:7300:ce93:b0:36a:1709:458 with SMTP id 5a478bee46e88-38280e29b80mr154463eec.27.1794938359122;
        Tue, 17 Nov 2026 09:59:19 -0800 (PST)
X-Received: by 2002:a05:7300:ce93:b0:36a:1709:458 with SMTP id 5a478bee46e88-38280e29b80mr154424eec.27.1794938358353;
        Tue, 17 Nov 2026 09:59:18 -0800 (PST)
Received: from localhost ([188.253.117.185])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795533170csm45168429eec.7.2026.11.17.09.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 09:59:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 01:59:01 +0800
Message-Id: <DMXOJEFHNR8A.SHYBI0NLEFPJ@oss.qualcomm.com>
Subject: Re: [PATCH v2] riscv: mm: Skip the icache flush for special PTEs
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: "Nickolai Zeldovich" <nickolai@csail.mit.edu>,
        "Paul Walmsley"
 <pjw@kernel.org>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        "Albert Ou"
 <aou@eecs.berkeley.edu>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, "Andrew Waterman"
 <andrew@sifive.com>,
        "Jisheng Zhang" <jszhang@kernel.org>,
        "Karl
 Mehltretter" <kmehltretter@gmail.com>,
        <linux-riscv@lists.infradead.org>, <linux-mm@kvack.org>,
        <linux-kernel@vger.kernel.org>, <owner-linux-mm@kvack.org>
X-Mailer: aerc 0.22.0.r39.g5d778487
References: <20261116022433.49952-1-nickolai@csail.mit.edu>
In-Reply-To: <20261116022433.49952-1-nickolai@csail.mit.edu>
X-Proofpoint-GUID: CaP890jWlHwSSboWy7NVRBBiP4KRfhSO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA3MSBTYWx0ZWRfX+0A+QMRRhLtg
 cSrcVlJcOEVmJuHF7rXuzDIGSoxDD4Xst81LgkW7nC7Wbp0+8kS6kp+0K7H3bitfEMCz6ZpLeNB
 gg0jhpB+0frH7mDoFAtNMYv++wm6tWc=
X-Proofpoint-ORIG-GUID: CaP890jWlHwSSboWy7NVRBBiP4KRfhSO
X-Authority-Analysis: v=2.4 cv=Cuwq4X4D c=1 sm=1 tr=0 ts=6afc95f8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=RQ3dwY0XcLBFaqRX7rIGyg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Bcon8dCWmj9BmVmNv9cA:9
 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA3MSBTYWx0ZWRfXyYSMzB1VGeAq
 BwUtH9yai3L+gkmuiMabeTQsfe6oY6OWf1wPuLhedUTC5pL8FSd3fxya77lqjOaz2Jtn+YLM1/m
 uNEXPFWqKTuMEBrzGFF3imTu216uLLmVGJcYap5xr35QEGEJ7QcZKWOgJIAQyGwagcwzU5Xq6UM
 EbgrcbhW3BgsJoh5TGDMoxQf/4UdskHUf0wOvKM1lVaAs7T2ix5/rAKGql/Ak9zskoc2WnBs0A7
 MgxGG/loNlbrDqsr6HEhl1J5gTwLF+wYoEcSl6d8iFq3K2PTEjf59yNyF7PW5xoZMHewgWY9fQD
 pgM9cgOtjVP0Ec+/LQrRaM96JsZgHvwr9e4Z37qV878w9unFosf6elgALsiRa0on16fTjRmABT8
 Xo5gkIxH6Q7aQaqQFo4bE1FJTaPxE1CsLzDfbgB65W5WwQgaSTgBNLJarnkVIDKtFV62kWOY5rf
 AU0u8SN1x+TPdE+7CtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170071

On Mon Nov 16, 2026 at 10:24 AM CST, Nickolai Zeldovich wrote:
> An executable mmap() of memory outside RAM through remap_pfn_range() or
> vmf_insert_pfn(), such as /dev/mem or a PCI BAR's sysfs resource file,
> oopses in flush_icache_pte() with the page table lock held, and the task
> never exits. With FLATMEM the kernel instead sets a bit in whatever
> memory lies past mem_map.
>
> __set_pte_at() calls flush_icache_pte() for every present executable
> PTE, and flush_icache_pte() records the flush in the folio of
> pte_page(). A special PTE may have no struct page behind it.
>
> Skip the flush for special PTEs, as arm64 does since
> commit 71fdb6bf61bf ("arm64: Do not synchronise I and D caches for
> special ptes").
>
> Reproduced on QEMU virt with the riscv64 defconfig by mapping the PCIe
> ECAM window from /dev/mem with PROT_EXEC; the patched kernel maps it.

Tested on a SpacemiT K3 with v7.4-rc3.

mmap() of the pinctrl@d401e000 MMIO window from /dev/mem with
PROT_READ|PROT_EXEC oopses in flush_icache_pte() without the patch and
suceeds with it. PROT_READ-only mappings and anonymous executable pages
are unaffected.

Tested-by: Ze Huang <ze.huang@oss.qualcomm.com>

>
> Fixes: 08f051eda33b ("RISC-V: Flush I$ when making a dirty page executabl=
e")
> Tested-by: Karl Mehltretter <kmehltretter@gmail.com>
> Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
> ---
>
> Notes:
>     Changes in v2:
>     - Reworded the source comment as suggested by Jisheng Zhang.
>     - Shortened the commit message.
>     - Rebased on v7.4-rc3.
>    =20
>     v1: https://lore.kernel.org/all/20261017013634.792220-1-nickolai@csai=
l.mit.edu/
>    =20
>     This patch was prepared with the help of an AI coding assistant.
>    =20
>     Reproducer (QEMU virt, riscv64 defconfig, run as /init with /dev/mem
>     c 1 1 in the initramfs; 0x30000000 is the PCIe ECAM window, any non-R=
AM
>     range does):
>    =20
>       riscv64-linux-gnu-gcc -O2 -static -o test exec_mmio_mmap.c
>       qemu-system-riscv64 -M virt -cpu max -smp 2 -m 1G -nographic \
>           -kernel Image -initrd initramfs.cpio -append "console=3DttyS0 r=
dinit=3D/init"
>    =20
>       unpatched: Unable to handle kernel paging request at virtual addres=
s
>                  ff1c000000c00008, epc : flush_icache_pte+0x5c/0xa2,
>                  ra : do_remap_pfn_range+0x284/0x3e6; the task never exit=
s
>       patched:   mapped at 0x7fff8418b000, first word 0x00081b36
>    =20
>       #include <fcntl.h>
>       #include <stdint.h>
>       #include <stdio.h>
>       #include <stdlib.h>
>       #include <sys/mman.h>
>       #include <unistd.h>
>    =20
>       int main(int argc, char **argv)
>       {
>       	unsigned long phys =3D argc > 1 ? strtoul(argv[1], NULL, 0) : 0x30=
000000UL;
>       	volatile uint32_t *p;
>       	int fd;
>    =20
>       	fd =3D open("/dev/mem", O_RDONLY | O_SYNC);
>       	if (fd < 0) {
>       		perror("open /dev/mem");
>       		return 2;
>       	}
>       	printf("mmap(/dev/mem, phys 0x%lx, PROT_READ|PROT_EXEC, MAP_SHARED=
)\n", phys);
>       	fflush(stdout);
>       	p =3D mmap(NULL, 4096, PROT_READ | PROT_EXEC, MAP_SHARED, fd, phys=
);
>       	if (p =3D=3D MAP_FAILED) {
>       		perror("mmap");
>       		return 2;
>       	}
>       	printf("mapped at %p, first word 0x%08x\n", p, p[0]);
>       	return 0;
>       }
>
>  arch/riscv/include/asm/pgtable.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pg=
table.h
> index 2ebd5fa5adc5..48eeeac1019b 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -624,7 +624,11 @@ void flush_icache_pte(struct mm_struct *mm, pte_t pt=
e);
> =20
>  static inline void __set_pte_at(struct mm_struct *mm, pte_t *ptep, pte_t=
 pteval)
>  {
> -	if (pte_present(pteval) && pte_exec(pteval))
> +	/*
> +	 * Special PTE mappings are not intended to be executable and may not
> +	 * even have an associated struct page.
> +	 */
> +	if (pte_present(pteval) && pte_exec(pteval) && !pte_special(pteval))
>  		flush_icache_pte(mm, pteval);
> =20
>  	set_pte(ptep, pteval);
>
> base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3


