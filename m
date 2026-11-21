Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795234505;
	b=sgKMqZL0bUDq5QiotILq35JaB4d9IEn8g0WxTFTYVQhkbdQemwwEayCBR+ixPAYIdGPB
	 yfhM2FrMYNWDzMCGLeTgSImRTLPR4otzMP3JSdPf85AOSM/noI2hrHjpE8Xi7i3JAyuM4
	 w30vvLCaIzFejIWxQEsr+zNiXla3+qeFKmahAt5ZF/Ovn7olFZObbVwGwRTaFTrZmhA6g
	 IbVoOi1XNhPiB7+WaVAcaMxvSpF+QXjXum3HpINH5m1ul+cj8Bmwq3Nu0jaZy2oyMdJn+
	 Qm9i3Me2zqQH+0arwb4b+aqbaai0om7ctqQ9/q7oeeqTLrjDdbHTNgqmo9yCWMNVt1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795234505;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OIMcSFsrYZPx5tM1ZfU2cFMDo/op/ylNmm2WEOSFOdY=;
	b=qWu0dZrP9lIfwarLu3GTBeSExHNNCLzO0r30Lk5iIBNpmLQVswa+SJUrLF8AIyjYRecR
	 1j2zzSr9jmi9eEe147flEXJoWRDgWmXxNixkjR6B6DlBdfvqjVcu76V4mZrIAj/mBcvm3
	 V1glL3K0iqjHNe2osrc+rybw9Eg2FdP0bVla3GzgnakhzcHllCmbKZTfLoFWSd5z8Ei3p
	 AWlzlSognmE+degkjvFUtsuL1L20/7Ai8N0ma8kXaul9HD6+FeoeuRojc+u2xl0ICY7dJ
	 Bzc9xhuYyeNuzutZheU+wyfcM+5ybeiJFPAyUO60FECVRcsmULWlcskGl/JxyH7u8Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=daK0dHOR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QZnOcfih;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE4A606A6A8
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 04:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AE4A606A6A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=daK0dHOR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QZnOcfih
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AL4Au62188209
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 04:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OIMcSFsrYZPx5tM1ZfU2cFMD
	o/op/ylNmm2WEOSFOdY=; b=daK0dHOR/AMPZH8w3KYSsDYAnHcLNrCRWu8rTXse
	dqMsh1bXfzQNTHZ5rADsOuQoAVYZJ+azjPH6Mn+lP9EQDDMrZfYKpp/y13o+b2/a
	tDa+yiE8ZVTP/RsqY98EmFX/SqQeNJuFq1J8gACd55YFitmw/ten/rPyQUg9w0D4
	iafHes1duRP4ZIyVoIlaXX0zXhq1i3LZhNiJRh3bNzPIxgqf4sAcLuyTXxqPaGPx
	EXAtaZGTh/kVGRUdlcKnPdwQ9ywQhi8tI5V9c997L5/vBL4vJJtZ3q3w9LQfMFST
	hHP/w0WjMFdsm8KN+YTqmwKirKuTfAlTeGJKanYAHL4Liw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32a6g7mr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 04:14:57 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-38531c1a566so3828793eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795234496; x=1795839296; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OIMcSFsrYZPx5tM1ZfU2cFMDo/op/ylNmm2WEOSFOdY=;
        b=QZnOcfihsdD/themipSR2a/Ejr86FGw0pUuAnfk7FubyfVPjINcY6MOqepTftH2MZW
         /GsC7WZPncCADF4baB7ZhbAaRPl49uYi6O8CJggE3YgRd8Xyg3bEJLGV7p9dz3BKjnab
         04Lyx5d7vhcRCzivGpb8Dyt0m89lUSvBWNNvzg4XyNa7QjxAn4soVw0sQDpgq9dXwruo
         uLK9hO7y07kQ2f3sFPGs2kjCJugcdvVJZc9hV6VdiqD2Z09S1ZyrSWNe1FEadzLMU5hN
         w7tGB0s0UFaVw4+7274UGAYeew8HKuwuGGoD59cR13ZWpGJgmd+vDmaL1p4VnnIozuyg
         lfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795234496; x=1795839296;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OIMcSFsrYZPx5tM1ZfU2cFMDo/op/ylNmm2WEOSFOdY=;
        b=eVye6t31YR3zaM3LRAbI1jBr/wSmYKUjJO9fnnQfwuPQ45L7+/0GQweEzCPBbvHt61
         sbypTURLb+4kGRbkIzAtH7tfFDAa7A15PYnwMebx1zvGThrXh+l/XN6tLxhHM7bsTPRI
         ZhEHdbI30u5kHbji7bezb0VpbJW1FywRlPsLUs/kH1fGmILecdV/sFRP2b8if7wr0Pv5
         u0zCupLydmuwmxfLAdndUlVILUMsCkc4JEY7XR1OSpBBHKH88t7biIlh1Bt8+QWey4pV
         GyIwu5PRL1KsmerR95aRhrWyWd75X8s0C8tg4INY8dewBFCr1GOKv6s8IEy3FT6BAX8i
         l5bQ==
X-Forwarded-Encrypted: i=1; AL+hErHA1JDxnI0yC/JVj+woLhV12AnK3QXXixidTJMMGLNuyAS6xn0EG4D7vua0Hyjp0+zvnrCWMOJaPxK9Xbc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WFiKXEy4jCB0jdqIoBZ7znDPDs4Su3e6K5f4yZ58uqGpmyj7H
	KFTQTxi/WpVS1OOedgzWDCMHzOcWd+6ggBPb05T6tg3iPrujvU4JB7zYzBZXgK9MI+O5eP26Eis
	PF3fElb7qoQO9Kyx1WzwWMT5Our92aM7Z2pHUqE1timnFgYt8d43TQMBL1oJBd4avXrU=
X-Gm-Gg: AZFdTZe4sY2ldX4Wket37cx9cwuHKNzyO5elufDQr3Gf91YHFMaxRIj3FTlWMG1TZod
	4Su+QkcWJqer6/SLzS+MnJjeHRj+0GaeH0lyC8Lrc6lp32fEGgc3tGBNCF/j5D/BLYASLgTif6R
	RcPL1Kh1f4dzzIT1qYOSuTF738HPpvmwUf/xa/UIEGoZyUGgl6JvjJQU9X75Bz5C5OgdwcczGts
	X5hiSQf+tTWLgyDVfAsoVcMQqpEZGX/UVso5OvDW1PPtbNrip3RMVvscq1v4ObI86+M1808mIFy
	psszSe2vutIOM4qVVchLNCzruh3Q2Z/2xUgVNVK1+Rwk9vxkgWFfj3eodiXH1lrsPbFPU8qBoye
	furs5paVKz6kxn/g+jVB+fdmynkJTFSh1EusvScHO8EBgX6SuWJTV01aXTqPSpFNhFZavfwQSri
	ek4OmAEVCWpqzPTnBWbKJrZQ==
X-Received: by 2002:a05:701b:4502:10b0:1b2:539b:496c with SMTP id a92af1059eb24-1b5569050c8mr5657072c88.35.1795234495912;
        Fri, 20 Nov 2026 20:14:55 -0800 (PST)
X-Received: by 2002:a05:701b:4502:10b0:1b2:539b:496c with SMTP id a92af1059eb24-1b5569050c8mr5657031c88.35.1795234495249;
        Fri, 20 Nov 2026 20:14:55 -0800 (PST)
Received: from hu-ashoraj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm10388581c88.3.2026.11.20.20.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 20:14:54 -0800 (PST)
Date: Fri, 20 Nov 2026 20:14:52 -0800
From: Ashok Raj <ashok.raj@oss.qualcomm.com>
To: Ahmed Azeem <ahmed.azeem@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-api@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Divin Raj <divin.raj@arm.com>,
        Bertrand Marquis <Bertrand.Marquis@arm.com>,
        jithu.joseph@oss.qualcomm.com, Borislav Petkov <bp@alien8.de>,
        Tony Luck <tony.luck@intel.com>,
        Ashok Raj <ashok.raj@oss.qualcomm.com>,
        Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: Re: [PATCH RFC 1/4] uapi: firmware: arm: Add PFDI userspace ABI
Message-ID: <awEavIhFldTD2k46@hu-ashoraj-lv.qualcomm.com>
References: <20261119-topics-ahmaze01-upstream-pfdi-rfc-v1-0-4772d18b9115@arm.com>
 <20261119-topics-ahmaze01-upstream-pfdi-rfc-v1-1-4772d18b9115@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261119-topics-ahmaze01-upstream-pfdi-rfc-v1-1-4772d18b9115@arm.com>
X-Proofpoint-GUID: itaxfWMoOQ0-GMF6XFqyskDrUyi5phr_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDAxNiBTYWx0ZWRfXyzX6IU0ZJZhv
 Zp7JPcUn0e2pyUJIB29JO3RYVqENtA2dzS9+Mi7ETamnXz/pvnK0i7D6uaV1QYfc4EUlCHuuoae
 Ec2hobihFmz9IMoEYInGzIsHLnhUhA0=
X-Proofpoint-ORIG-GUID: itaxfWMoOQ0-GMF6XFqyskDrUyi5phr_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDAxNiBTYWx0ZWRfXx5iMGm4RPDu7
 jlvh9PAL3SN6LglHNaFvtme5U2UwQYfgY5sfnoW7YTkXQwRzdiVSHQ8l6yrbZaRZhcdSJEc6Kco
 md/EPlG1CSzfnadmZygIwaVLrHlRZSUf2zggtBIEot9gwPdflW7+tKjzEXhOcxbdjtELCuQGM8G
 rNU101poeBmVrpzAk8uqBlUNbNbpvzDFzedwjCkbpcEqyiKm1+Ml6LUKjKGL/gyMszm57MtvCfu
 Xxu6U/RAJnCRzC4NOLfDqRuKKqBZQioYmyl0lDZTCJjDh3kQqwlw0FOjkPp61QeBjjKXtyIz9ut
 x1/N6YPoYvLt3ktB3E7hKmuTBPtwAh0AWZZLhHTZtV3Mo8trnra5KJ36j6B9M5ixwFQBmjtlJKk
 wPwLB0cjD3yNfyfvuAxnNLeSApmMPgXlJmoS8I5HqmTN4fpmbwqWHFsQn6wRp1WanfNaAQSHT9n
 Iy/ID2ANcLILXo0xk0g==
X-Authority-Analysis: v=2.4 cv=UbHE26SN c=1 sm=1 tr=0 ts=6b011ac1 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=JfrnYn6hAAAA:8 a=ibG3jk6wdz103AFF48AA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611210016

On Thu, Nov 19, 2026 at 03:36:03PM +0000, Ahmed Azeem wrote:
> From: Divin Raj <divin.raj@arm.com>
> 
> Define the userspace ABI for the Arm Platform Fault Detection
> Interface (PFDI).
> 
> Subsequent commits introduce a driver that exposes a per-CPU misc
> device. The ioctl definitions, data structures, and return codes
> must therefore be shared with userspace. Add these definitions to
> a UAPI header and document the ABI for /dev/cpu/<cpu>/pfdi.
> 
> Placing the interface under include/uapi ensures availability via
> headers_install and clearly identifies it as a userspace contract.
> 
> Link: https://developer.arm.com/documentation/110468/1-0alp0
> 
> Signed-off-by: Divin Raj <divin.raj@arm.com>
> Signed-off-by: Ahmed Azeem <ahmed.azeem@arm.com>
> ---
>  Documentation/ABI/testing/dev-cpu-pfdi             | 103 +++++++++++++++++++++
>  Documentation/userspace-api/ioctl/ioctl-number.rst |   1 +
>  MAINTAINERS                                        |   7 ++
>  include/uapi/linux/pfdi.h                          |  89 ++++++++++++++++++
>  4 files changed, 200 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/dev-cpu-pfdi b/Documentation/ABI/testing/dev-cpu-pfdi
> new file mode 100644
> index 000000000000..e07ed6baa7f8
> --- /dev/null
> +++ b/Documentation/ABI/testing/dev-cpu-pfdi
> @@ -0,0 +1,103 @@
> +What:		/dev/cpu/<cpu>/pfdi
> +Date:		May 2026
> +KernelVersion:	6.18
> +Contact:	Linux ARM Kernel Mailing list <linux-arm-kernel@lists.infradead.org>
> +Reference:	Arm Platform Fault Detection Interface, document 110468,
> +		version 1.0 ALP0
> +Description:	Per-CPU Arm Platform Fault Detection Interface (PFDI) misc
> +		device nodes. Each node targets the CPU encoded in its
> +		path and exposes the PFDI service implemented by firmware.
> +		PFDI uses the Arm SMCCC SMC64 calling convention and is
> +		PE-local. Userspace is therefore expected to bind itself to
> +		the target CPU before opening or issuing ioctls on the
> +		matching device node. Each node is single-open: only one
> +		userspace owner at a time may hold /dev/cpu/<cpu>/pfdi for a
> +		given CPU. Additional open attempts fail with -EBUSY while the
> +		device is already open.
> +
> +		The ABI is defined in <linux/pfdi.h>. The following ioctls
> +		are supported:
> +
> +		* PFDI_IOCTL_VERSION
> +		  Read the PFDI version for the target CPU. On success the
> +		  ioctl returns 0 and copies a 32-bit version value to
> +		  userspace with the following layout:
> +		  Bits[30:16] PFDI major version
> +		  Bits[15:0] PFDI minor version
> +
> +		* PFDI_IOCTL_FEATURES
> +		  Query whether a PFDI function ID is supported on the
> +		  target CPU. Userspace passes a 32-bit PFDI function ID.
> +		  The ioctl returns 0 when the function is supported,
> +		  and -EOPNOTSUPP when it is not supported on the target
> +		  CPU, reserved by the specification, or otherwise not
> +		  recognized by firmware.
> +
> +		* PFDI_IOCTL_PE_TEST_ID
> +		  Read the test engine identifier for the target CPU.
> +		  On success the ioctl returns 0 and copies a 64-bit value to
> +		  userspace with the following layout:
> +		  Bits[63:32] reserved and zero
> +		  Bits[31:24] vendor ID
> +		  Bits[23:20] reserved and zero
> +		  Bits[19:16] vendor-defined implementation ID
> +		  Bits[15:8] major version
> +		  Bits[7:0] minor version
> +
> +		* PFDI_IOCTL_PE_TEST_PART_COUNT
> +		  Read the number of available test parts for the target
> +		  CPU. On success the ioctl returns 0 and copies a signed
> +		  64-bit count to userspace. The smallest schedulable unit is
> +		  a test part, and valid test part indices are in the range 0
> +		  to count - 1.
> +
> +		* PFDI_IOCTL_PE_TEST_RUN
> +		  Run a requested inclusive test part range on the target
> +		  CPU. struct pfdi_test_run.range.start and .end are signed
> +		  64-bit values.
> +		  Passing start = -1 and end = -1 requests execution of all
> +		  available test parts on the target CPU. Any mixed use of
> +		  -1, reversed ranges, out-of-range indices, or non-zero
> +		  reserved arguments is rejected with -EINVAL, either by the
> +		  kernel before the request is issued or by firmware.
> +		  If firmware reports PFDI_RET_FAULT_FOUND, the ioctl returns
> +		  -EFAULT and copies a signed 64-bit failing test part
> +		  identifier to struct pfdi_test_run.ft_id. If the failing
> +		  part cannot be identified, ft_id is set to
> +		  PFDI_RET_UNKNOWN.

Hi Ahmed, Divin,

+ Tony, Boris, Jithu

A few UAPI/design comments below.

The range-based PFDI_PE_TEST_RUN operation has a reasonable case for a
structured interface: it takes an inclusive start/end range and can return a
failing test-part ID.  Encoding that in a sysfs write would establish a
permanent text grammar and still require a separate result-retrieval
mechanism.

However, it would be useful to explain why all of the interface is exposed
through per-CPU ioctls.  Intel IFS, for example, uses sysfs for simple
control and persistent status: run_test, status, details, image_version, and
current_batch.  That does not necessarily mean PFDI should copy IFS, but a
hybrid design may be worth considering:

  - sysfs for stable scalar discovery/status such as PFDI version, test
    engine ID, test-part count, and power-on test status; and

  - a typed interface for the range-based test execution request and its
    structured result.

Also, before struct pfdi_test_run becomes stable UAPI, please consider
adding explicit flags and reserved fields.  The structure currently leaves
no ABI growth space, despite already having a special -1/-1 all-tests
encoding and likely needing a structured test-result field.

Finally, PFDI_PE_TEST_RESULT reports the result of tests executed at
power-on, before system software booted; it is not the result of the most
recent PFDI_PE_TEST_RUN.  Could the naming or ABI documentation make the
power-on semantics more prominent?  The current name is easy to read as
the result of the runtime run ioctl.


> +
> +		* PFDI_IOCTL_PE_TEST_RESULT
> +		  Fetch the stored out-of-reset test result for the target CPU.
> +		  If firmware reports PFDI_RET_FAULT_FOUND, the ioctl returns
> +		  -EFAULT and copies a signed 64-bit failing test part
> +		  identifier to userspace. If the failing part cannot be
> +		  identified, the copied value is PFDI_RET_UNKNOWN. If no
> +		  power-on tests were executed on the target CPU, the ioctl
> +		  returns -EAGAIN.
> +

Hope this helps.


Cheers,
Ashok
