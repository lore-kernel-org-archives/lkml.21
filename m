Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431219;
	b=slTm61Pn4OqzcfbBHFuBQe4by6Z5+CbDBBSROJu6bq4U1IlsJzyyLsD9mqpVkre5wY94
	 acCMSE2lZmRixrg57JTPFlJ3Etj6N5A+P7O+M/AQw6/IM/SgQ5cyLA3DQP+HrIDdpCG6f
	 Msa5LlCcV6rnFYmMvelWFmHiekM0DLT/mWU/G1OEdxglFTlmYRu/NQyaXwgAntLSwXlAP
	 I8836FXdYqI5VMaULsdNdHfKZlqr6A2WojuHPKEsbVWrjvmI4iZ5/ppAXDxhe4TLUmVtI
	 98CwUHPQ/C9SXU+aU5MVDVLm4ZqPxAoXw36revjtMnRtKF/fBQBhDBfK3okzqhMNTSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431219;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bNh+CyyEc4DwqBf8wMJAEGceVFKZ9FL5VhwVvApn47g=;
	b=3PM7qxc6Ivk2ZBqaebf7n1eAlPIFIybb/m441GznsQfgNPTSsbxSo64YNEulVjFL3M+U
	 rBX4E7NNOUMCykHl2n09VXdGfnjyOoxsBlQ4Z9iKRmjmDW6CbJnbcuva4dcAqcFv3BPik
	 NZ7cdskKRTomnCNfrp12EN/K0ZdUJzGUB0ML4bvXlKlccBVU8Pvcef4CpWPGJG4vB+PB5
	 FV0nPw/uVi/OliNS+EeWgLb2/aO1qfQaxt4ynckz6VXfWL0tFW8HWVVetMBDKFtnyZXSJ
	 F+VeIQve0mDp/na+Cfg7bz1a+r3TqbTwfSnNYjD3b5IU9Tbd74T9MdcMScI8QRTFi2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HX3HwfBC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b0NRInf+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACF4606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ACF4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HX3HwfBC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b0NRInf+
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9Fuwx1427508
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bNh+CyyEc4DwqBf8wMJAEG
	ceVFKZ9FL5VhwVvApn47g=; b=HX3HwfBCWdXddtSwB4vmaRfMN8yczlk5b1UupW
	RdZJC7p3jzLKWOdaFpDy8J4KzHGAfX+9dN94BPJ036lS7WA65NjVSB6oCOVplQuS
	VVWxOU28L5Env2+ooo/tK2NQVqQIbEATQtacmCNhP1JytBHmAbM/bErZRjHUCeIw
	pYXU+bh97mXVDWGAVTmSB5KRtkyxFUnaM5WcER/Da2pulRCo24a2D3gg27vXu2P9
	E+ZGv7zWJh9wwsbLGZlhlpHNYW/HingX8FXsMAJgvlfXu/2Y3yZDP55j3S/GpTMP
	f3qHp43Bbk5d9YKEXOu3Twyj1mGBPi3ftb7w+aD1CV3sGjcA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyh11a3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:53:36 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd5ca3840c5so3385263a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795431216; x=1796036016; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bNh+CyyEc4DwqBf8wMJAEGceVFKZ9FL5VhwVvApn47g=;
        b=b0NRInf+k+rov2pCqiSbuliuxvZN5qe/RO0VdbSD9tdUFIgLNJkyCg/BiAl8FNedHP
         MqiL7EG6Y1CkQ4mGPTiXbvjB1OJ7F9cCmrHHvrNM/ZYRAdU4oK5p2uZR0N4LxVzYqDnD
         NKmNpzHPXb/6iZpG2CW7yu3i5Vcbzc1sWHdPJ/WmnfBlAetFtctSIMToK2NOr4MJc8eq
         xgRbWAsqvks/enCbtOw+bFMpSOp/VFwev0IElOTDlYSXttddiWr2QvUuH7SRT5FXfpKu
         1YcvhYbUno4/x9Ij5i+FITZlM+9N1DAhd19jPmwJuIpUFx2h1ls8Pp1g076qX3jhH/Mb
         4dSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795431216; x=1796036016;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bNh+CyyEc4DwqBf8wMJAEGceVFKZ9FL5VhwVvApn47g=;
        b=OiZvi+ghbFu2m0POsTlVuFw6EecLLfqjLkiKS5siC2nauUGN2uaNRyMO2E0Yl1llz5
         EzY9LZwN3H0WSeVmkqc0ILjwqMQNY7eVOKIy5AefUQL1Cv3nAmYtcJnjURnZvQEIvw+m
         MKkX0xDVMTRJEIsXfh0W8FMCXl8BhQjjNF3iwFaR7jRoW38RIduJTYl38ivY/8BWeR3P
         9Clw8Xq9pRn1brhZNHHKjwDPNNH9A211G/95noxogi247Zjhy3fzh4xW7bj17Y5kDSrf
         zYotN0G5/wyQT7AEkkimE15dPZH7Uft4cyLydFop3gUZhyISs0dUYVxw/lQA4CLaewY5
         efKw==
X-Forwarded-Encrypted: i=1; AL+hErHYu/a8no+dYL5YMCHLBUWVb32YlRNwDK6pgUiZxQAf0UQS/G2Jy12cy1cGzMiMDCcjhyoo8JLuWsNctx8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/XZPYbwd/n8eRj9CpcGtBxlC2+LVRBG53FvAMmfDGZkmRSDr3
	g0VA1XCrF9SibPyIjRlNDYUKN8nvSPU183XGT/VNBUdB6v5nwhSMfArluLQAftCItbcpGYduMdP
	4nQwXA6npEbkB0+f/4ZS9agx0DPwsP/thuG+A9Ljv/IvD9RcY9iWhZaLxGBCmj/bAFRk=
X-Gm-Gg: AZFdTZctt8/E+yt5S9d+4ubYYykSF4j73HNk33sx49TZlekV/nq3lOivMUk+wbnjyAn
	lw8H7HFo3tPDHerMZ5cQaLqx9KcosW76XwIhQRWO9vpknk0YOOco/AVmaLpPr3Xo0XfhCPo+tN8
	mJVUbAr/89SQ/b2S9Nwu/z1aGJF6bzs6KVAB36dm/ALK4TSa3ugjBiNVQePlBC6f+zdMYFVX8Bt
	PH7rUybIoHOigP9EdIdFU4h62eBuChe5cWejQQpEJ0B1gzaZRgEQnyNbGStzv+oGlkBP5lKZ8Nl
	Tc4CSx4d3svqieHqgxeuqhBxOGIahv5Jhx6C9Eu0DsOx5fp6kWeVSUDYY5yqKmYBq+tug7CNXaP
	Bc0PVc68fCgMFGuFi3HyHGK7i1luIbShGWa2DO2ea//MSx/A0ESkrLnve8D0FTia2P+HXGsIZCE
	ZoJ5jFFZwyHfo=
X-Received: by 2002:a05:6a20:7351:b0:3eb:a4ae:3aa9 with SMTP id adf61e73a8af0-4014db5890emr12796882637.63.1795431215946;
        Mon, 23 Nov 2026 02:53:35 -0800 (PST)
X-Received: by 2002:a05:6a20:7351:b0:3eb:a4ae:3aa9 with SMTP id adf61e73a8af0-4014db5890emr12796862637.63.1795431215504;
        Mon, 23 Nov 2026 02:53:35 -0800 (PST)
Received: from hu-gthawre-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e456a7sm5330863b3a.29.2026.11.23.02.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:53:35 -0800 (PST)
From: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
Subject: [PATCH v4 0/3] arm64: dts: qcom: lemans: Add LeMans Draco EVK
 board support
Date: Mon, 23 Nov 2026 16:23:09 +0530
Message-Id: <20261123-lemans-draco-final-changes-bringup-v4-0-dbfc15cd0883@oss.qualcomm.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABYbBGsC/42RwW7DIBBEfyXiXCxY7NjOqf9R9QB4iWlsSMC2W
 kX590Lcqq2USr4gDQxvhuVKIgaLkRx2VxJwsdF6l0T5tCO6l+6I1HZJE2Cw54wLOuAoXaRdkNp
 TY50c6GqMVAXrjvOZclWrem8aBShIAp0DGvt+D3l5XXWc1RvqKZOzQ8mI6bp0us9bfzLyWfb0N
 k4+fNybLjyzvku1W0otnDLaaamwLQ1ndfnsYywusxy0H8ciLSR3W+CHzLc9d4FEFhIb3XHdtgL
 +IYvf5G2dRe6sWGM4GKa76gH5tg404GVOnzetU/5KAcFqqAAKEFXTpExOTzJMvT0V8RHq9glav
 eC3DwIAAA==
X-Change-ID: 20261013-lemans-draco-final-changes-bringup-1b7b76f8b2e3
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Kishor Buchi <kbuchi@qti.qualcomm.com>,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Ajinkya Inchure <ainchure@qti.qualcomm.com>,
        Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>,
        Karthik S <karthik.s@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795431208; l=3830;
 i=gopikishan.thawre@oss.qualcomm.com; s=20261019; h=from:subject:message-id;
 bh=Dx9co28BgHh+ZbRepP+Xi3Pa2bEV5oGrB1qLTdgcJbU=;
 b=4zyKjN5Pm0j88C6+45ST9/N/UP/MG+/PJBJwPyESKzaRhVvZPWR2YeOUtk+X/MWhfcNyDDiY4
 DDpJnBPQg2zChKMMKOSBz3q1NibLJe9gOKuu9y4L/DFwQ1L3JpJm2bN
X-Developer-Key: i=gopikishan.thawre@oss.qualcomm.com; a=ed25519;
 pk=l7diN2ZWn/39T24vZixhPPrGDEUF6RKc19MsWZubM6s=
X-Authority-Analysis: v=2.4 cv=NM1AaE6g c=1 sm=1 tr=0 ts=6b041b30 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8
 a=aa3sxGzdGyLt4iHDoZcA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MyBTYWx0ZWRfX+RpfKo7DJVVc
 lOIX5jh0SHLWE+Tl+1JsmZhs9YzmUS9BFjc8sCep7T8hfeHQLmULni3FStQjL4oEU/PPebocLZH
 Nt8K4qR8FMaKNA8jmtjNd66Pk5Np3ho=
X-Proofpoint-ORIG-GUID: qtOP5RDC-6glD2KGDG-sTcUzBu-vF3oY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MyBTYWx0ZWRfX+d+6tvmngr8x
 OzQgWNJQemFX4dGCH6CWlNAAaWJpP8WEeqyQbKqSyEnKIPRDPVDWs2eDbIT1+crjfXa1m5J/dDi
 Y4buxlyNdcYXSGymTqmpi99jbKDb0xP20CypRRMCstwPjFGsD2nlTgrDtZy3FkWNyXK2rYbHIt+
 255opqUrTfvrzDrszpglRLjtKskmAsa1vhPgcvdA1IaNNcmeM7zHQ2/a2HPJi7b7YTV2BhQ1x2i
 4PnhBJ0L4e+FNKWXq+avUWs3G6ZGeEzpX8P0YDOqL1BCM3Dq2URr2Ma5xaM1ZfM1B0Q0aGgPBlF
 ttRg77ggYWNIgicJwzvJjAKz+iRWLaumL43zTst6r6eNLMCu89gaqhdCHqgeP8VMutJsV9RPsdc
 hPrqMiCIm4ioICjgGpd6Wal1ClvDdBUBwPl5Deg+wCAi7saGZcDhv7y4QfxCjSM3o430LZqiqq0
 x+a/oEQEstRVb4wlxYA==
X-Proofpoint-GUID: qtOP5RDC-6glD2KGDG-sTcUzBu-vF3oY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230043

Add device tree support for the LeMans Draco EVK, an evaluation kit
based on the SA8775P/QCS9100 SoC targeting automotive and industrial
use cases. The platform consists of a System on Module (SoM) paired
with the Draco carrier board.

The LeMans Draco SoM integrates the SA8775P/QCS9100 SoC, three
PMM8654AU PMICs, UFS storage, USB 0/1/2, GPU (Adreno 663), and
essential connectivity. A dedicated SoM .dtsi allows carrier board
device trees to reuse common SoM peripherals without duplication.

The Draco carrier board provides board-specific peripherals:
- Four DisplayPort outputs (DP0-DP3) via MDSS0 and MDSS1
- I2C GPIO expanders (TCA6416 x4, PCA9534 x2) and EEPROM-based MAC
  address storage on i2c18
- Dual Ethernet (ethernet0/ethernet1) with HSGMII PHY over SerDes
- ST33HTPM TPM over SPI16
- AMC6821 fan controller on i2c4
- PCIe0 to NTN3 switch and PCIe1 to x4 slot or M.2 M-key (dip switch)
- M.2 E-key slot with 3.3V supply and PCIe/UART for Wi-Fi/BT module
- Audio playback and capture via max98091 codec (Tertiary MI2S) and
  VA macro for DMIC capture

This series is functionally dependent on the ASoC driver and binding
changes for audio support posted here:

https://lore.kernel.org/all/20261123072522.2358819-1-karthik.s@oss.qualcomm.com/

Link: https://lore.kernel.org/r/20261019-lemans-draco-final-changes-bringup-v1-0-dcabe94f1074@oss.qualcomm.com
Signed-off-by: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
---
Changes in v4:
- Add audio playback and capture support via max98091 codec (Tertiary
  MI2S) and VA macro for DMIC capture. [Karthik S]
- Add #include <dt-bindings/sound/qcom,q6afe.h> to lemans-draco-som.dtsi
  for Q6 AFE DAI ID constants shared across carrier boards.
- Link to v3: https://patch.msgid.link/20261119-lemans-draco-final-changes-bringup-v3-0-db08f12f0cd5@oss.qualcomm.com

Changes in v3:
  - Add PCIe0 (connects to NTN3 switch) and PCIe1 (routable to x4 slot
    or M.2 M-key depending on dip switch) with pinctrl states and IOMMU
    mappings. [Sushrut Shree Trivedi]
  - Add M.2 E-key connectivity slot with always-on 3.3V supply and
    PCIe/UART graph connections for Wi-Fi/BT via pwrseq-pcie-m2.
    [Wei Deng]
  - Move MDSS DP PHY supply assignments to lemans-draco-som.dtsi.

Changes in v2:
  - Sort DT node order: move tlmm block after i2c18 node. [Dmitry Baryshkov]
  - Drop unused sub-node labels ethernet0_mdc, ethernet0_mdio,
    ethernet1_mdc and ethernet1_mdio. [Konrad Dybcio]
  - Improve dt-bindings commit message to explain the two-compatible
    SoM/carrier hierarchy. [Krzysztof Kozlowski]

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: netdev@vger.kernel.org

Change-Id: I1ef390e8d1538ad58c74b8247dc6b405267b3d19

---
Gopikishan Thawre (3):
      dt-bindings: arm: qcom: Add LeMans Draco EVK board
      arm64: dts: qcom: lemans: Add LeMans Draco EVK SoM platform
      arm64: dts: qcom: lemans: Add LeMans Draco EVK board

 Documentation/devicetree/bindings/arm/qcom.yaml |   7 +
 arch/arm64/boot/dts/qcom/Makefile               |   5 +
 arch/arm64/boot/dts/qcom/lemans-draco-evk.dts   | 990 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi  | 422 ++++++++++
 4 files changed, 1424 insertions(+)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261013-lemans-draco-final-changes-bringup-1b7b76f8b2e3

Best regards,
--  
Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>

