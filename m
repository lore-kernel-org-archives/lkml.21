Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605214;
	b=vwQZwwTOP+dblmPdGS4h0DhjO+Hg6nCakwYpvO2JgqCUN0xFuwQb9p0PDYkht0Fj2ZpD
	 baKmw9hApRmzIrPW8ivxKuUas8VuPIQ+yDgrZHp5ePmgszfBA4adgrYIiuOg9CxeP/eHC
	 eP5l3mkJUug7XWHnz6yh9mGgxDouvLybDWKRIXEOUTX4znXMpDLiwXGVsnfNjirYjxbKE
	 nCIJwT9t0QnvB7XD/HKsUXjzFOcJbq5jLYM5QYazKuDI6tENslHEuA1FNKdsJGiaioHs/
	 0XJsQkp/V6xltt0NxNGpEXhDr3l3TjbhRM2vcpRr0CH27MjAMh2u9FPGqZZNEzvRINA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605214;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mN5Wi/oP+/iEZPIHVVYdEV/26IVRoESzTs9DlS/w+zw=;
	b=UNeWoywierUK/fk1yqNe4fOP0pED8IsmrvJXlQ+sjBH57VaPnt2pJQhazWKct6pz3wHF
	 MLaknGuJh8OP0UOrXXkxEl67y+im7tDn8Nf8NSglwl3jwiINjq7AZsNClTzg7tBELAjZk
	 whvAcaD1C8zgqfWItjWJ+Pdj/oXItAMzBLqEEb6Ee3tocvxFRyD6C7eT8UjNrwM5L8+zB
	 fY1jTxZPTraUO0DYIcF91Yrl4bs6COWCJIYOpjqOujiRUYozUf6n+1otblR1Y7pecz6WV
	 RM4D0+sl23P/VaQpo5qydsf4VfIAb8oZe3aLCsjH2OPvjN9WqAq0aQlghOte/dkZ/Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o9MBqwBO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h6ZbwCHi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFDB606A329
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:13:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DFDB606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o9MBqwBO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h6ZbwCHi
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mOWS555534
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:13:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mN5Wi/oP+/iEZPIHVVYdEV/26IVRoESzTs9DlS/w+zw=; b=o9MBqwBOu3LAk3Ql
	kluDjP24AD5Fne6UqAfHIGo4aXZyOPqqNhGWSMuLNOSzZjicR5UqeSWaXbzQRXpC
	3S3swPaoOA2/2pfeLK9d2q60YA6NW3o3k2M7kqjahCRwHEdXGu2VXsKVK1N3XgsZ
	GksJF0GKZyCRJ4lZx4U1z6Z1+Ow8Q527VpGzEaa9uz5cHC3dp/nR+xbu2dNLJlY5
	FCGD5GihpERpZoM47wKRHcbqGFn2tMDIVhD9Sx1KWJROBzqzDOxGvGsuq+J6CfMk
	o0mkvgLk1sjDO6DsCgr3DhlD4tNBN24Fob5Y9fb9gNq6l5d4gdTozjxZ5YTltUDq
	VexuVg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnrgku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:13:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53657d237ddso8539371cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795605212; x=1796210012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mN5Wi/oP+/iEZPIHVVYdEV/26IVRoESzTs9DlS/w+zw=;
        b=h6ZbwCHibim5dZLdQTk/KVIK7DHkQFXs5f9wRPTh96Muk4tbeCJJqgCHL7Z/e0Jedc
         TekoU1O25P/yI1+9qVgzPaqcMKSHASm1kZZu2T7j/Eno9s7aaumrfCs5aEv+nXoVygI8
         adNWrRp3i1xX2Gi62yz1ksyqUkOeeVkOrpfy98JV5lh/Fd4MU9rbRy3KkykFP6uYnXJI
         6fEThBtu4ZqXOlvdhyYeoPD/xjATetEUqCMjMfECyvva6EeGe8SfOH5/qF/zCFrmrcP/
         cjhgLkvK79I/HsPFV2tvbY9i2USI+TIP7h0hNlEJ44lBZc5aBvGuUNybglgNFByMPiRD
         5/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605212; x=1796210012;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mN5Wi/oP+/iEZPIHVVYdEV/26IVRoESzTs9DlS/w+zw=;
        b=pcuzM8YWh3vzdmw7xEjFNocCzvbZa5h9UwFfjUij227mcmMxxuYLLHP9636FMAdMwJ
         QhYbtXvZgsdyj2QN+kj89BgdhXSP3SmCz7iCfStbc9aza/grhySY13go2bYeboV9luyH
         JHGg6xvRqaShHvhNh4q6RqE7MOqDYpiWIpZqaHxQ8LcO4KzOX5qjfSMSR4qT1KEYpJQ6
         M3IFd/tx3PkvYpu5e/AhgmhFYpxoXoPe47y4ov88RZSZMmCTPqWd7liy8jfVE/Hh4+up
         fCeM5pAoCynkJabifuALDVBY460eXgRhbP232F/BdwjWVyF+I1uxQUsMUMtn4ym0k1bV
         E+Gw==
X-Forwarded-Encrypted: i=1; AL+hErEjCBy2v3R+Fgz71mNfoUDwmcbLPkuoWoaIsU974B6w2PmJMjUkEbGYeHe7TD1+DjIWSjb5dcPPfKhw9MU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OciWmW9PCtSp7skp+o+LnD24ZVDzY2+oUvXs60EANs0Nh/crG
	tmyewU1Ckz8t8s3G37FxP3EK1ZhHK/o8EmAtaJo2uF/Yv4CsrdBpR6yGMb9LHM3ImqiqifGV1v0
	T5nlVNpD31/YzCFYO2gYoF8RATNiYW763hYWIpHsbBQ+uA+CxHkss7kuX19YXCkZMWEQ=
X-Gm-Gg: AZFdTZdVs+iWNrpIh5BFmxxRw2RfqZr2jI1kfJkBsHVJCNv8rH0jWQZwA9d6572N6LL
	u1mXZPmbMpSbAPrn9JdDi1ZhTAKkK6/6Jg01AHyATSFhCjK0ABEkGWlPgDkq/JZBd55r046mOqF
	BM+wW90WUd71kFCLFjNKgx9usSKCOezVxzKpgJdYhKXbMPQF7w35HnmViyf+p9fxCZSNODv3eVh
	piJVAopn9F6XEXo3/lsWWRevmqXxT6wPjrjx+orTGmFT9wkOddUBBZi1xl78o/R0e8h565SiGe9
	GtLCRLZXHMhn3ZQAnXJPnzj1OODF/ebp/g9weBwBI7LakeP/iJTlPGM4IFqNDR1gqPUZm19lXQz
	igql3mjQF7Okwut6yp2s5qwReLEgNsSm/8mxZfVCJj41UZzNBu5d/BSbdsEUZtB/VEEozTjY=
X-Received: by 2002:a05:622b:57:10b0:536:61d4:cc80 with SMTP id d75a77b69052e-55d76a6b28dmr296719761cf.5.1795605211594;
        Wed, 25 Nov 2026 03:13:31 -0800 (PST)
X-Received: by 2002:a05:622b:57:10b0:536:61d4:cc80 with SMTP id d75a77b69052e-55d76a6b28dmr296719371cf.5.1795605211141;
        Wed, 25 Nov 2026 03:13:31 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36e35641sm8146988a12.1.2026.11.25.03.13.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:13:30 -0800 (PST)
Message-ID: <e3add71f-8624-457b-a304-d5791015bae1@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 12:13:26 +0100
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
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: glymur-crd: Describe the PCIe
 M.2 Key B connector
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, alchark@flipper.net,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261122-pcie6_fix-v2-0-2e0fe615d90b@oss.qualcomm.com>
 <20261122-pcie6_fix-v2-3-2e0fe615d90b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261122-pcie6_fix-v2-3-2e0fe615d90b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX+6ywjd9lT8rd
 0DqmgEENfSMz6YcLR9uaIEI/Wsjoge8N7L1top/Q6NNXZXB0TxXripRjFOGqxEL9a9lK6CCrWIA
 eUCnGMk6ANBOePAVmkvGStuh9tuLUiH1cfuPeqwHDAuEUvMcyGl0X1kGv6nmw+FUIBSjoxQGUJk
 /b7f9EWxkM2211d4ZKwMNAZHWaLBQ+DCCgHaUKGw2tGJP4A7Usd3RGC8uPRQIEGKhSct5vOZoVG
 IYpqCuGErCA+rPhsx99TWs8t5LRKK1jqR2DmnLIcDgza+kaCRb+QEs1dbCI3LulnWAHaYBsU8Si
 A5fONzxqPlqhz4+CXbdfipCcq0i+sl9dCOX82ddWnO3IuD4oDSaesXXQmFYOUo27eI4Swzkzqrj
 wvbYfT+bLLZ2U8F74CKRQK2n8m239ujhllHUlkfe7oEWsM11n1Q7d74fdO5R3xJP9R8nZWH7Xth
 hZQenpV+KyibQ6KGjSw==
X-Proofpoint-ORIG-GUID: rjSCL5O-SDRuT5a_0S7D-dGpn6f2nJFS
X-Proofpoint-GUID: rjSCL5O-SDRuT5a_0S7D-dGpn6f2nJFS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX45yfaxFc7oNs
 trCRx8oXUXX8DvsaRxU3h+6SqQutzR4kWSaCyr4cMEAfn7OpgZkKtpV4yv4FhRVwr1bztDdRVn/
 j02DwOU7J3rziLFYhvG2Z4Qq3HpAvqQ=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b06c2dc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=fmVD6mvdgdatrdQPAe4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250044

On 11/22/26 7:45 AM, Krishna Chaitanya Chundru wrote:
> The Glymur CRD has a WWAN M.2 slot connected to PCIe6, whose vreg_wwan
> supply is described on the PCIe6 Root Port. Describe the slot as a PCIe
> M.2 Mechanical Key B connector that owns the supply, so that the slot
> power is controlled through the pwrseq-pcie-m2 driver and the PCI
> pwrctrl framework, like the other M.2 connectors on this platform.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 29 +++++++++++++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> index 3a9cd5f3ec2b..a66ba8c0ac8c 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> @@ -230,6 +230,27 @@ vreg_wwan: regulator-wwan {
>  		pinctrl-names = "default";
>  	};
>  
> +	wwan-connector {
> +		compatible = "pcie-m2-b-connector";
> +		vpcie3v3-supply = <&vreg_wwan>;

On the schematic I have, it also routes FULL_CARD_POWER_OFF_N,
DISABLE_N, GPS_DISABLE_N, 2 UART ports (one muxed down the line),
and a USB port (also muxed down the line), plus of course the
m.2 config pins

Konrad
