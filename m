Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540261;
	b=2zLEt1NKkOr5ByH35xLDRwO2Mma9kWjc+juUaVsV4Cv2Bxh8xFhEQnuQqJuaAypFg8PM
	 iMdXY3rDctT8WwUPR5PXRa0TCpITJXoRMSox+QzSA58uubPlX5SQ6AMayjKDcGIB+xGdL
	 NrHRBbzBBmo77JR9YUjTt5PbngGDFFjKdNlFCit+PhW1t7oz0VclV1MBFOQMk2OePdhtf
	 dTYseK+eDWAvTyWnPezV6qxzsr7FOJTwjkRn8h6LhJ5Ffcoj0L9vf+9NDzOVsA5AF2MPs
	 3eOk6q2DPE5EOQgMUrK3+Y7yAHI71X9zFc0CUo3hJQZnJXYaj6T8hyw80SN1l7jmr0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540261;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3C06+AGRplNn4HpuEEq4N+vB6T6r5jTxGaKPsMTS1cI=;
	b=bmRlhurRvWEb9k4VW785vscd2nYfYcEt7B9j3wgX41nxhN1mdWEGt+MnR//X99sGHhyT
	 zdM5cgjXbAMmsVTvLVsIE4/vrXPaMHAj9maY9Wzbr90ZjZULRjvd3ciWS2iq/Hr/9YvlX
	 pt5MhvjorbaINhiR5n22/0FxyyN3au153WlLeJmqjvqvzUyuw179Agpr6OsImad28j+ng
	 Pm95VuwXi2KJKYsWXkSqvZiyIaJ0gv6SdjyN5QZ0bsfJDrdyZD08Den9McwUAAWdekHg6
	 4CUJndeS+xp4lMN3mm+azO6iLK5nfQa/JnyRSkFg2QUAtj4mC6ELqYNh/rVCqXU9uRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=On0RbNge;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=THcpQsSX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD53860A2622
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD53860A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=On0RbNge;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=THcpQsSX
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFtmDS1684099
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3C06+AGRplNn4HpuEEq4N+vB6T6r5jTxGaKPsMTS1cI=; b=On0RbNgecIE+Z6ZA
	UevaVQVEqEWIaEY9S/3PLJ46Z9LcW+1gf/bfmdaRWe/Ilx/XTrwEEqpfOO1ST/E2
	3jITyDrQkrWVXoSF9MEY3CxphB5sH1PbqrP8UlNjOYs0+KsZuIPLlrWJQ49U3r06
	SExIAvKnAlHLn1DMtInny6jyMjrhkpAOe2coFxsSgbuUCN359crdKLEicH3X0tU9
	fZMsLcHjPasu/h168BdK9q//DjwFm1CIJvPMk9fmiaKRcDEUDjDIBLjS6V4MZrMD
	hAtjcroeagok/FN9zShwSjT0Wdv9xzPBX7mYkHNSqwKtdwQY9oF9458JQQXA1LMk
	lYZwfw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5dnggbha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:10:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f040c6e0ceso45376065ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795540258; x=1796145058; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3C06+AGRplNn4HpuEEq4N+vB6T6r5jTxGaKPsMTS1cI=;
        b=THcpQsSXHIQPOeV+ZOa94JqihPuWoz3N0GMhuY5I0tSMXO1TOjHyT6FxdJ/8vmGD5a
         ugjjz9y4qjhbAwu1KkNXox9NRZgsff8Y0CvniprN7xb+8S0lBcY5zVPc1rfoqqNidavp
         u0gVs8oMryk9eT9Ck0Uut3kXodG/eNvNh30NPwmnY85+34YWLSJEZZzC4VXT9IgbkMj1
         WWg8F7a44Pj6YxvB4gFfS7adXf+xx+h3md/GKLPOaiLE0GChoG3BtwFskBV1m7qblLtQ
         zM3eQQNGirhfjlFpjLIZ50vlzxN/+B3ykv9K2fVHs80sO4IdqXCopNtWak/SPZlP+EFl
         gvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540258; x=1796145058;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3C06+AGRplNn4HpuEEq4N+vB6T6r5jTxGaKPsMTS1cI=;
        b=Hq/ZAKzCTBAf2dP1Qlrok7+U0wBTzjh5Jl03gm1KURajzHQo39fIe2sQel3JJNzAly
         LXnY6LPkQAv8oYG5L7W361Vvdj8v6/a3Vz+GkAM+w5ozCB6/AfjTnRqkdPBjBgpq4Q+k
         rgzqyCv/ADuyoSHFDkPxfCDJ89f2WfEEkiGgbBz8TFRXQIjEt7SHu7piDjZUijaZ9wbd
         4MsmEWdxYoxG8oRJb4QVFJc0MtZxNGMAxa3Po9IAMOEnVby2Kz1BdrRNoAOBAr/irmUB
         4OfMwD1cFI2KI3odZBGS7HLI/2C0eulB7xGdUW9gbYHknhrYNUc1tAPF6Z3/HJQRwMNv
         w+2A==
X-Forwarded-Encrypted: i=1; AL+hErFyKoF0I7Oi/RcIdDyOVe6FUqWluf3aamgzGOUhYz/AOkQ/wiScpqfoZpTccXtB6p1u5M5RtYldCg6pxl4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cNfnei6Z4JBI2Jxs+Ehe7ibc2HgzaNiRl32djmnubJJvJc3bc
	gWE6vlqw02utdQCwUAHJuzEhywDRDnOBzYFV+JWMHHBbUgy6P2KsDZJX3xKj2jZzik8X5074sRl
	2o3v/d7DOOa1hROAMCsAaCOidCFVMhlOT5L886Da86KStkid3JSW3A1XLj4eixQ3zBHE=
X-Gm-Gg: AZFdTZdp0VWGQubKY3SeKsRXPRYBeUkTlAKrmotgZfxYJCKf8LG7UBoUYFjCFE9P0ps
	V7jMyELDjI6JPnbPdswWDnpWkz4LSOlXA9sA7ooo9iI9MUrlIDkNnN+IIaa+IaTWB/iv8GujCJ+
	5n6pC/SR948di9Jxyw8cYhfRaaIhFN3Wgs+G59NC0aLVYQbfs5Ea2zzlv/s4Ca0tExN2j90JfXz
	zDejzZqYmI7++wzZuXsrTjCDPPoXNpNDwYebuzGwRfZxlFrN7LG/vRQ6D/AEE9Us4ld2pTj64/I
	N5Yprv/pV/X5PVCtlDwVMX/YCRbrseO6kDfHIvYwQRF7/8vfMZYodGzlKRSm277rwb9zxa4kVkP
	zJ9OkhM1M6arm2LZC6XEmJSOP+JjmiHXtJds4TPNEg4cKQrXFxqHUDB+U23fuQkx5iwItC8axmQ
	TDGI9B5g57sRilYU2Wmw==
X-Received: by 2002:a17:902:e80b:b0:2e9:9a19:c43 with SMTP id d9443c01a7336-2f03f118277mr150323265ad.15.1795540258225;
        Tue, 24 Nov 2026 09:10:58 -0800 (PST)
X-Received: by 2002:a17:902:e80b:b0:2e9:9a19:c43 with SMTP id d9443c01a7336-2f03f118277mr150322945ad.15.1795540257698;
        Tue, 24 Nov 2026 09:10:57 -0800 (PST)
Received: from [192.168.0.3] ([49.204.135.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f14a432sm72737855ad.75.2026.11.24.09.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 09:10:57 -0800 (PST)
Message-ID: <9e1403bc-9069-4024-b4c2-c62c2f0d5100@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 22:40:51 +0530
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
Subject: Re: [PATCH ath-next v4 00/14] wifi: ath12k: add initial Wi-Fi 8
 support for QCN9575
To: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling
 <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
References: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NyBTYWx0ZWRfX3bYJV67hWaaQ
 nYDw5iMMGU+7VdXSRx/Mcr0zhTeBuGTgqXiQ99+gKfZ+51emrw9/z9hHDnbkuDF9VTpVKbRNIuu
 mnc6kBv+zqYaqZb2p+bknj1Ex1w84pk=
X-Proofpoint-ORIG-GUID: -Ta2RNt40u4RLNetUKoU2SYJCMubs85H
X-Proofpoint-GUID: -Ta2RNt40u4RLNetUKoU2SYJCMubs85H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NyBTYWx0ZWRfX210/QS1ANZJL
 Wlq2Ked69NYpaqazEOjsdpNJbYS5dKOgFMalGqu0CKMhhRRYZ4Xuzp26F/wBwHwqYCnKL7FUejI
 s/AMRCNub4gTeTrmNg9kdVvjfidSfB2Onur0igO43F+Fu6hP4s34sOYf3Ltf/0xq+j4yCU4Gglm
 yO09M0Cv4Cwj72TYg/1+gQdvuPH6MKP6Bys0pXw+fmZ3cI5EUcKJvLEwn0NSN5kgUiHFXIf0eyD
 /aC03mTZfTCBRkGAvvjGeEB+RsEWD6SWYuxPUSmivjhUJxCCvTzbdQWA4w3ES4UYajcdlm5Ii6Z
 MQEfN48eZUiBzwMYyq6jAdT74156fTa5q690Gjz+faaGFwu1iidYRqovlF9VWlugRuU9PgnpCbZ
 ZHcfP+SzzxQopN08Vkrj22BofFIFfBXFtgSC7Po4hxRfeTElSQUTW6UQErlGppd2B5S4RimOnyD
 COflnYSYCwEvSt/FU7A==
X-Authority-Analysis: v=2.4 cv=U9cHnuru c=1 sm=1 tr=0 ts=6b05c523 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ag5bUDVj9uQYXS0Rj44fbA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=stkexhm8AAAA:8 a=VwQbUJbxAAAA:8
 a=1XWaLZrsAAAA:8 a=JfrnYn6hAAAA:8 a=BwtDmdOm_RcmM6cCN5sA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22 a=pIW3pCRaVxJDc-hWtpF8:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240067



On 24-11-2026 22:13, Madhavan Ganesan wrote:
> QCN9575 is a Wi-Fi 8 (802.11bn) PCIe target that represents a new
> hardware family distinct from the existing Wi-Fi 7 devices (QCN9274,
> IPQ5424). It supports 2.4 GHz, 5 GHz, and 6 GHz bands across upto two
> radios.
> 
> This series adds the initial bring-up scaffolding needed to register
> QCN9575 with the ath12k driver. No protocol-level 802.11bn features are
> enabled yet; the goal is to establish a functional base with the new
> ATH12K_DEVICE_FAMILY_WIFI8 family tag and a dedicated wifi8/ subdirectory
> that follow-up series can build on.
> 
> Patch 1 moves the PCI window register constants from pci.c into
> per-device structures, so Wi-Fi 7 and Wi-Fi 8 can each define
> independent window layouts instead of sharing one fixed set of
> constants.
> 
> Patches 2 and 3 extend the shared QMI layer: a larger WLAN config
> message to describe the CE and service pipe count QCN9575 requires,
> and support for downloading an extended firmware binary.
> 
> Patches 4 through 12 introduce the wifi8/ subdirectory with its own
> Makefile, followed by the hardware scaffolding: hw_params, HAL
> register table, HAL ops and descriptors, unified firmware image
> support, MHI channel/event config, CE and service pipe map, WMI
> resource config, and hw ops.
> 
> The final two patches integrate QCN9575 into the driver: a mac80211
> ops skeleton is added and hooked in, and the series closes with the
> Wi-Fi 8 PCI driver scaffolding. QCN9575's device ID is intentionally
> left out of the PCI id table in this series, so the module builds and
> links cleanly but no physical device can match and probe; the id
> table entry lands in the follow-up CP/DP series once the device is
> actually functional.
> 
> Each patch compiles and links cleanly on its own; where follow-up
> patches fill in callbacks, stubs are used to keep the tree
> bisect-safe.
> 
> This series has been boot-validated on internal firmware version
> WLAN.WBO.1.0-01410-QCAHKSWPL_SILICONZ-1 together with the remaining
> Wi-Fi 8 enablement patches (CP, DP setup, MAC datapath) that complete
> device bring-up; those patches will be posted as a follow-up series.
> 
> In addition, each ath12k driver patch contains Tested-on: tags for
> existing platforms where it was verified that there are no
> regressions.
> 
> ---
> Changes in v4:
> - Dropped patch "dt-bindings: net: wireless: add ath12k wifi device
>    QCN9575" per Krzysztof's review comment.
> - Link to v3: https://patch.msgid.link/20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com
> 
> Changes in v3:
> - Replaced u32_replace_bits() with a plain AND/OR in "refactor PCI window selection to per-device layout" to fix a build failure.
> - Link to v2: https://patch.msgid.link/20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com
> 
> Changes in v2:
> - Addressed sashiko's review comments in patch "refactor PCI window selection to per-device layout"
> - Link to v1: https://patch.msgid.link/20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com
> 
> To: Johannes Berg <johannes@sipsolutions.net>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Jeff Johnson <jjohnson@kernel.org>
> To: Nathan Chancellor <nathan@kernel.org>
> To: Nick Desaulniers <ndesaulniers@google.com>
> To: Bill Wendling <morbo@google.com>
> To: Justin Stitt <justinstitt@google.com>
> Cc: linux-wireless@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: ath12k@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: llvm@lists.linux.dev
>   
> ---
> Madhavan Ganesan (14):
>        wifi: ath12k: refactor PCI window selection to per-device layout
>        wifi: ath12k: add extended QMI WLAN cfg for CE and service pipes
>        wifi: ath12k: add QMI support for extended firmware binary download
>        wifi: ath12k: add Wi-Fi 8 directory and base module scaffolding
>        wifi: ath12k: add initial Wi-Fi 8 hw params and init helper for QCN9575
>        wifi: ath12k: add Wi-Fi 8 HAL register table and hal init hook for QCN9575
>        wifi: ath12k: add Wi-Fi 8 HAL ops and descriptor definitions for QCN9575
>        wifi: ath12k: add unified firmware image support for QCN9575
>        wifi: ath12k: add Wi-Fi 8 MHI config for QCN9575
>        wifi: ath12k: add Wi-Fi 8 CE config and service pipe map for QCN9575
>        wifi: ath12k: add Wi-Fi 8 WMI init for QCN9575
>        wifi: ath12k: add Wi-Fi 8 hw ops for QCN9575
>        wifi: ath12k: add and hook Wi-Fi 8 mac80211 ops skeleton for QCN9575
>        wifi: ath12k: add Wi-Fi 8 PCI driver scaffolding for QCN9575
>   
>   drivers/net/wireless/ath/ath12k/Makefile           |   1 +
>   drivers/net/wireless/ath/ath12k/ahb.h              |   6 +
>   drivers/net/wireless/ath/ath12k/core.h             |   4 +
>   drivers/net/wireless/ath/ath12k/fw.c               |   8 +
>   drivers/net/wireless/ath/ath12k/fw.h               |   1 +
>   drivers/net/wireless/ath/ath12k/hal.h              |  10 +
>   drivers/net/wireless/ath/ath12k/htc.c              |  18 +-
>   drivers/net/wireless/ath/ath12k/htc.h              |   8 +
>   drivers/net/wireless/ath/ath12k/hw.h               |   5 +
>   drivers/net/wireless/ath/ath12k/mhi.c              |   4 +-
>   drivers/net/wireless/ath/ath12k/pci.c              |  46 +-
>   drivers/net/wireless/ath/ath12k/pci.h              |  11 +-
>   drivers/net/wireless/ath/ath12k/pcic.c             |  27 +-
>   drivers/net/wireless/ath/ath12k/qmi.c              | 484 ++++++++++++++++++++-
>   drivers/net/wireless/ath/ath12k/qmi.h              |  73 +++-
>   drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |   6 +
>   drivers/net/wireless/ath/ath12k/wifi7/hal.h        |   9 -
>   drivers/net/wireless/ath/ath12k/wifi7/hw.c         |  14 +
>   drivers/net/wireless/ath/ath12k/wifi7/pci.c        |   4 +
>   drivers/net/wireless/ath/ath12k/wifi7/pci.h        |   8 +
>   drivers/net/wireless/ath/ath12k/wifi8/Makefile     |  10 +
>   drivers/net/wireless/ath/ath12k/wifi8/ce.c         | 404 +++++++++++++++++
>   drivers/net/wireless/ath/ath12k/wifi8/ce.h         |  13 +
>   drivers/net/wireless/ath/ath12k/wifi8/core.c       |  31 ++
>   drivers/net/wireless/ath/ath12k/wifi8/hal.c        | 434 ++++++++++++++++++
>   drivers/net/wireless/ath/ath12k/wifi8/hal.h        | 171 ++++++++
>   drivers/net/wireless/ath/ath12k/wifi8/hal_desc.h   |  88 ++++
>   .../net/wireless/ath/ath12k/wifi8/hal_qcn9575.c    | 124 ++++++
>   .../net/wireless/ath/ath12k/wifi8/hal_qcn9575.h    |  15 +
>   drivers/net/wireless/ath/ath12k/wifi8/hw.c         | 250 +++++++++++
>   drivers/net/wireless/ath/ath12k/wifi8/hw.h         |  14 +
>   drivers/net/wireless/ath/ath12k/wifi8/mhi.c        |  70 +++
>   drivers/net/wireless/ath/ath12k/wifi8/mhi.h        |  10 +
>   drivers/net/wireless/ath/ath12k/wifi8/pci.c        | 105 +++++
>   drivers/net/wireless/ath/ath12k/wifi8/pci.h        |  11 +
>   drivers/net/wireless/ath/ath12k/wifi8/wmi.c        |  57 +++
>   drivers/net/wireless/ath/ath12k/wifi8/wmi.h        |  13 +
>   37 files changed, 2510 insertions(+), 57 deletions(-)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
