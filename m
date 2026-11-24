Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795524998;
	b=5m45jrSDJFT1Pv7OhzMbo9OXGMZF81YOF/8jBKHGR+a76EMpebLRXAk7ASyZAfK1dB3W
	 nZ+Z/UFoE7JhpdoUmml+3THfLE/KEWXXExsNWXCUrRf7cFJMaD04jsDFfHQJ2bycpks4M
	 ApW6AO2CzcCx7wt9GzMRm112otQA8RKEhRQ/wErY4j2CA7+ewmWiwp9vmlUnVGJ2yTYKI
	 t59racq+WVFjH4zLmcSR2m0Yn9BI7+Oigc8RpVTdGgWIc4qy7lCD7i4r3MKrePLCG8WJ6
	 PMHj6uWmQOhCstYQF81x6dOTwrTade5JKox4kACj708PuXGfaZVGTjDir1OhgycQPyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795524998;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9oES+zTBCcykoKXXZVrUciLOTnpuEmEfvSoDUlTPuAk=;
	b=uwJ5I7H+xSK3JdyJ7q1L8c+gLcdzwHaxTeQyDxymSgUJ0hBB5XqqTxMf1JkZNj2I/XtW
	 XdH5tpLLaB8F1RQGrhOkerK0PTb1YDrloWnLQMqhxxQzBUUzTtxBp11rQb7MFO1lQZq3l
	 SkJIlXoQlxbaFcqXILI9A/YzJsrNrCDVPDaZ8EqOfvV4601bJ6jS3lbF/CYYB5OUQnPy3
	 2h/b3yYLDDYFMw3+bsqTEaMNvROFEi+1MwHw8NFusou73PGyVeiPzhrV/dJe/zxJyrSXl
	 WWJE8Zdb/znrj2jdm6dM61uc1H4rocSxyje0Pcpu3xsJWSGUX98tM6ZcnuBr++FCVnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DF9l6fBh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U6sVP8mx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464CE606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:56:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 464CE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DF9l6fBh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U6sVP8mx
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuVB51736780
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:56:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9oES+zTBCcykoKXXZVrUciLOTnpuEmEfvSoDUlTPuAk=; b=DF9l6fBhukovloIC
	lPAH3FWFLecA/J39y/gmIcTRUZ4Lq6KdDnf7flVguXLxS98olplmggiZUXMdOIB1
	+JlpZBE+CaOqvVWntozlbjrGn6AftMMOpc8LyhzNuhibzbGLIz0/Zt9nW3v8RW5q
	w/F/ZoQAYlFQNrSu/yZ8aeWv5iZjgv2EJPhYqJCjy00T79DfpxAfSxSM/SNeXj4M
	rQcE5pKEZCYXh9LTd81L8LsMXbMw0XKfa5vyEiCfqs64YvY18Y82JnqGBgB2n4Iv
	GiiS60bcEkckNkgC3aYBeqNE2JmW8vKrZuL4Bv2vZ3Wrm5hTNG1EJJRis2JmeqdY
	NcTLZA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvd2sur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:56:37 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8aa185840bdso3147979b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795524996; x=1796129796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9oES+zTBCcykoKXXZVrUciLOTnpuEmEfvSoDUlTPuAk=;
        b=U6sVP8mxSKlvEm/EudUn3ZAej40wOKduQD5NpBGJqkNLRX9WC0UvxxQ2E1Xjep/O2x
         Idkq77kpvilQ+6Loj8UnNwkOSwR9qp0RmjsPDZgNzXmzvC76q/Tlqt/inVbcIQMFOgNe
         Eq1beSkFD+isz/6vWfBm5YYBBh8KZsRBvCxSzE+sFXWQJQLuyfedCmfjEyVy1Gteb2Nj
         K1q9JNsitszecM573L/j4MG2cCjUTDMDid5Ct/LOyS7tIf8eUTVl/RbsoL/w5kMLHTRi
         CQAGsXsAeEG8xgv1NGvVQ+MJS/4TknMKpwh2p2JPhqqXyaUWKk2Qa3ofPCW/JChA8KnE
         DYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795524996; x=1796129796;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9oES+zTBCcykoKXXZVrUciLOTnpuEmEfvSoDUlTPuAk=;
        b=B7ETwOVtPvSyBaqQfWpylYykr1bZBdQ5flWo/GBcXDzmWmEIxCYbHiZVsGHM9+NwXp
         Sr+iwA/+V7dOgCrqtlf3IpdkLLCZ1/Gx4tuNdIsxGp5Wgip89iOZyf9j5KRq4kSQFsyn
         CN3IJetJiWd+74hZeznbHhsmNk386Onp+nhf2/te1SSph7JcnpwOgUBZzmeUADq4Z+K7
         CpwOnD3NzigKLBwry67VfvdqdzUaJckV8UT8/MesNXHgi1iPYyRCkZbn9nRNVmtfHjGX
         PGKGpT+VEryyA1BvXdD2fMcy3F2w/rYlGxHTIylAdeGV7jtyCoWfZTxi8ibxtAvO804o
         MnQA==
X-Forwarded-Encrypted: i=1; AL+hErELVK33HC5DhQ140A5Kir1QyMRKiqLPBLRZk4hXMCiplTLKJCIvIccRWI1oB0hbfWvRuWT3vLgUKWTGiq0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lNP953giOhJ9ji3Q+Iy00pl8kFWVxFR2GyhIW0ZWYTY/tGYNP
	IwPffiqWO9NVwZ3/lmHc82vBdmMA318eEuZebk0vckABZaisSrkMZP8C9XUEwcapRn1wlf5B8yt
	cs21fMufTc/UlJJTpobTzsM3iw/th7ruEOGG4/Y0rykqC26btUT7LSofuhmBwSqryuKc=
X-Gm-Gg: AZFdTZeLd2YGgYLI/j8bUpiym8enZfEhj29IlHdRaJt+BruG6oaRDKSpCZR39TH9WQy
	aBtTU2zV5w7V3Mth8Vk0n9fjposq5KEdmhiwvuoHhEC4CDXG07Zww/H3Mo91dgW9lqYe2/Xcm7O
	WhiqsMz8l/wB3Gs+JmPPp4UlLAIEVMR3Dx0cJs9gmP2/v6KprImfSABunf2ZgXX7kCVv8UecyBQ
	oloIHFnoFHKr4BogQsxffYdkjkg+d0iKuicoYEl+wEfQMEgSftaLJJ/gbMRDRZoIIAFMDYXXUpw
	pGa9/C2mQKREo3/c4K5yIjrQ9r3U+SgPzzKF/aDB+yb8LVEoAav3vOZeTfCcT4FgPPiZouxztYw
	JRynUwexW424b0nsk4rkSrij720jKJpELA5cjqDfkqXfsNXM6zFZePcthRXj5rSepc6J/RUDr1+
	OdFQ==
X-Received: by 2002:a05:6a00:4c19:b0:8b5:f313:9f54 with SMTP id d2e1a72fcca58-8c87d32b35cmr12156939b3a.56.1795524996079;
        Tue, 24 Nov 2026 04:56:36 -0800 (PST)
X-Received: by 2002:a05:6a00:4c19:b0:8b5:f313:9f54 with SMTP id d2e1a72fcca58-8c87d32b35cmr12156914b3a.56.1795524995577;
        Tue, 24 Nov 2026 04:56:35 -0800 (PST)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c263sm7146216b3a.11.2026.11.24.04.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 04:56:34 -0800 (PST)
Message-ID: <0747efbf-c712-4185-b08a-82c82a49b4a2@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 18:26:27 +0530
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
Subject: Re: [PATCH v2 0/4] Add Parade PS195 bridge support to enable HDMI on
 Glymur/Mahua/Kalambo CRDs
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261116-mahua-hdmi-v2-0-0b5af6bf9e70@oss.qualcomm.com>
 <357f0fcb-792b-4b40-84d2-cdfd05ca05eb@kernel.org>
Content-Language: en-GB
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <357f0fcb-792b-4b40-84d2-cdfd05ca05eb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6b058985 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=p1ES9sUSU55KWy82zVEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1MCBTYWx0ZWRfX4+2u0wP9rF5p
 DpYFjc+N6C+dnNKprHKVayFGq9bndgBGks71D/rMKgrEEXa+KyVHTTxGkBBYqlG7DThkeWoURbC
 fXKoDojXIAK4Opaxa+5pgWKeh7bhx5v6HGwFXkI4dmMnF/1qxMTm7ZUnJk0cCwndfk9l7loRL6w
 f2omnB+2biKX2dhuWxWKIf8H9SX/UZ5wIfbFBhMkSfrBXUNcEnbUZUxAdc0/6mtODxLu7vwPUzd
 8WbTLo7V7aZ5Bwm7koCThPbuE4AKbrq5yKrucxVQZg9ck51dQ5WfPjhvkENJFUCMJdyIpAp+zoT
 FNFzgGGN27P8toKeJrOvHiwJCFolR+o4OPVnfdYh3zjZ9BGTmmbQxc6NveyEVxSsnbMud/jmPoj
 KP7aGRV7m/qFXRY7+WZKq5vJoLq4gkC60k2tE7I2naYz49vyC/cPRKkiihW0veqBwtD5nmjrxw0
 69+qPZiEOLCvodUWnFw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1MCBTYWx0ZWRfX9jlQRikPKtSY
 atYNNMkKGyNIAu8dJDhTNWHf+gP0ckBUsWfd9+0cwjUBS5xdtxycQvxtpdTnDn9Ihy1CN9lvmF5
 xSlEp70l53fqcolLYAwqIwcBRzhoci0=
X-Proofpoint-ORIG-GUID: LTxF1OzOm7G5XAh3hiPAAlY6B5vKl1rU
X-Proofpoint-GUID: LTxF1OzOm7G5XAh3hiPAAlY6B5vKl1rU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240050


On 11/17/2026 3:54 PM, Krzysztof Kozlowski wrote:
> On 16/11/2026 12:34, Nabige Aala wrote:
>> This series adds initial Linux support for the Parade PS195 DP-to-HDMI
>> bridge and uses it to enable HDMI on the Qualcomm Glymur CRD family
>> (Glymur CoB/SiP, Mahua, and Kalambo).
>>
>> The PS195 operates autonomously using firmware loaded from external
>> SPI flash — it handles link training, EDID access, and hotplug detection
>> without host register intervention at runtime, so no existing bridge
>> driver fits its power-sequencing and reset model.
>>
>> It introduces:
>>
>> - a DT binding for PS195 (supplies, optional reset GPIO, and port graph),
>> - a DRM bridge driver that implements PS195 power sequencing and PM handling, and
>> - arm64 integration (defconfig + shared glymur-crd.dtsi wiring) so all three
>>    variants can route DP over USB2 QMP combo PHY to HDMI through PS195.
>>
>> Deps:
>> PHY PLL change: https://lore.kernel.org/all/20261028-glymur-phy-v3-v6-0-1f1d2e565a66@oss.qualcomm.com/
>> Glymur commonize change for regulator: https://lore.kernel.org/all/20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com/
> So this cannot be merged. DTS cannot depend on drivers patchset. We
> talked about this multiple times already, please do not couple
> unnecessary dependencies.
Ack, I'll remove the PHY driver dependency in the next revision.

Thanks,
Nabige
> Best regards,
> Krzysztof
