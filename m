Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795577125;
	b=Qu47gxRoLWYqPtKWiI0k0g0m/63W98QeIlueAK/ja529s3BKVflxkuGe9KWz+TuzY79i
	 NZmOoNFkLr3L7gJBm/DeBfLLrkfJX/d1sByBtfGTpbxoHZmM3D5BoBhld4ZQF6MYXM9ax
	 UD62NEreNTF9+JNCe9ie4JWRubGI92Q1lOkh8Ui3P0hZrdVF2afrVHjpOEyy1KEAKHltw
	 w995bvMuPeordPogM640oafL9A7ELcPx8XiOMzgF5wQ+ng+iZ/Kgnh3VJlts6eNgaRZNH
	 N/OPyJNJYz84NVQ6S6F3hehxh7ZXXSFREJl93AEU53HA8ujGRLAoKxsT7LLL7BzycQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577125;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=guaeEGSbxYdMeTPf/CsUwW7Tc5rMOf59WZ5PCzNstoM=;
	b=GDjPazPDw3ZWvHyGCGSdkDfvpTmWGioNwuW3yTqE6e9xPLFArR7S2rBfzibbgIQ8yPQt
	 TvhuHMSUEOwg2LevX/PPtiuS8CxgZT7/YgFVIC8WSLGYSxMorKRjFD3tt07PotJnWmNt+
	 wz5Bom7UVtsZOQU9A061EkRUPW7NojYxSoY/aPmyUvKNKdcD8+oMfWJ8uwODWmSGK2p20
	 9DBjrRI9d76ir/UzB6R+syxhB4p7moCA3XIRmyojSGtz5bC+MVx415Ki4qoWM7woD/q/I
	 wi246L1jGofQWlS0RheuRvQrc4lxO/hgyA1TiylXwY0UG0vsHrjh3InOBz2vB4HkBxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UYMMyeAU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="hW/HpCBg";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CAB606A330
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1CAB606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UYMMyeAU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hW/HpCBg
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP2ArwN3974001
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	guaeEGSbxYdMeTPf/CsUwW7Tc5rMOf59WZ5PCzNstoM=; b=UYMMyeAUKSimR04q
	KPMkE6j7SbeK898Say9b3E4NXVhVSSHx3kDORxNylQttW7ReeH+AQCbDOy/MzG3h
	GKayGNaRyNwfAX+OFMye6X8EFT5zUOwDKayLKRR+Y/0UB/yqpyMdV2qd2Lsm6Am8
	xNozeY5tyVBnbIqVZgZEgSSnCmTaKqFTtVY9zkMoYREgNYBHng0ewsl5cxq07OMk
	7gc20kk8Ivzqt/8t0ZHHZR+WVvEWEpORRIMa6Nn2vIYA18xe11pnuO0E1WcS1FKN
	NH0E20CyQo/Y7e+cxKvvtPTbShp9UM3v/2Bqw5uFjfJDXiOZderBFQnWXznCBEQo
	fe3Jgg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6rrgm7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:25:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-89fb6a45c48so4008054b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795577123; x=1796181923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=guaeEGSbxYdMeTPf/CsUwW7Tc5rMOf59WZ5PCzNstoM=;
        b=hW/HpCBg7DWDcJqUYV88NBg0BqcuEQWf+OQ9CXprdEyUuNBjNJjnV5IpMBw+IrK1Et
         0g5EdTEojVyzcWFPogUPtIycfO6OJGCiLzvOqwxkUiDx3BelFIgcUoeK4WJGeNGhNqi3
         jlYqAbuSTvrNAGjvwIFVKsK/eZXVimlDPnOOt1zPOMOd8wHRoeXsS1tWUSqGtBl602oB
         0PZTbPrvWYVg0b0VtiRl2PvHIlLnXHMZ/O9Kc35BTdQbrgkdYYQG7a0vlzzYfC4ureK2
         GrKZ8IZ5VoTCwS8vWniXvqMR9eIWaLi0EGY7LsMLFRc+Giluq68olua/OEoeOwPCnzWd
         BQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795577123; x=1796181923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=guaeEGSbxYdMeTPf/CsUwW7Tc5rMOf59WZ5PCzNstoM=;
        b=qlvMG92bQ3cIiNsArGHzCxPTAevTFQ7CBz8Tx+9BOsbzaF9feSz+jclT116fKM/OEB
         vuN7hOYw+3eC2FoFzRIIK+V4MD2uEUDKXtEhje42B3u+D93loG4FSeB6ecQzIzRRo3Md
         NEiv/DNOJ9RzUO63Kk5wWlHK5RCpdorPsM4s/fx4wLbaKN8a5OP1rT1xKorWNeStmomA
         wWEU8VEcnPDCmpxOnUmYd00P1UQkcw633PzvHLn77DSuMuFDoRxbEoBRBkXD/41tU8bp
         NFvIkXDSNpANoRPxeSqw52OUMns8BwGdlGqD3AMPB7jYrASGMW7iH2Uo3L46RyG/rLgG
         q+YQ==
X-Forwarded-Encrypted: i=1; AL+hErGFGL6cNsKsCCSTjOxj+aNS60Sor2ofX03EyKBqpJpmv5SCdaDZYTPdpvG3gDOAH848sH9E+qAZpMW+YQ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mk8UvVNNmEtR7NMFjCuuLfLiapyHvRCdllHNBqX5UlSPYfT3b
	tF/75bQ8xqJEwKtaoKai48YXYRrlwXAQBO2xQRlHujSrpyT/3L22wbc80VbpQDYaQ47l0RZx4+4
	6EYXJg+vy6824kljfh4uaOwJ3KQciLa2us0eAMiFXavBTbldA8yzSsJsZrXwFwntN/TE=
X-Gm-Gg: AZFdTZcRecsVAyCRWhYtDTp3A/5rbDEZFGUCyfOGwW4cYH8HJSJ6r5lcBCEQcmJpNFm
	dMcqsbzDnwdZhfivsgXS20q2WEYHl19QV9VLqAsUOTFZh2SHXp8Qtym31Zi/TqNd7bwRSfmg+5X
	DaGzUE9cin1zhibjZKqPzLCXekUd+S6PG3vZ+J8rJ/W+zoj4h8rZsQh39RAhxV53evpa5ASYEaw
	vtEhSmuqoRC8eV0loQup2YGP3xuyttm53DYkdP0FsmDLo2vSVThljYGTDwu/q8/ylCayYsPRGMx
	2HxMSBuvGdBLrXIxlWsDU2RZXGa2Oyw7Cd6ze+Budd7pcNXRNAlqorwpuLsTjW9qC/yQVMMQ/Cz
	EeJy0aLP/sA37rF5SkqHo08XR+FNLfPEXZkiDwXw/IAGM/5qf/fGazzEXSDQrxMDVjvRv31FB6C
	FaHp3gXcU=
X-Received: by 2002:aa7:9a8c:0:b0:8b5:94e0:91a2 with SMTP id d2e1a72fcca58-8c87baca56bmr15326671b3a.10.1795577123376;
        Tue, 24 Nov 2026 19:25:23 -0800 (PST)
X-Received: by 2002:aa7:9a8c:0:b0:8b5:94e0:91a2 with SMTP id d2e1a72fcca58-8c87baca56bmr15326640b3a.10.1795577122901;
        Tue, 24 Nov 2026 19:25:22 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8cbe173453dsm4762399b3a.25.2026.11.24.19.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:25:22 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 08:54:12 +0530
Subject: [PATCH v12 5/9] media: iris: Handle CPU_CS_SCIACMDARG3 register
 write via program bootup registers hook
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
Message-Id: <20261125-glymur-v12-5-5c34dfd73fc2@oss.qualcomm.com>
References: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
In-Reply-To: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795577086; l=3644;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=Vz1PVBmTlFZkSCWZjrjzOWTwplg/khgPXuic+w5vTLI=;
 b=KpbccKg+aY4XQVucemH2sUFqyoAGN1CBaySFRU+8uphvoe5z7Ta3DXuO2XTXFJze+KryjVQ70
 I7ALjbgY+xpBUAZheGsqJv1KhMiDxUFV313hzi0EDhq9djP4ZeUHmVV
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAxMyBTYWx0ZWRfX4xPd7kRQdFQG
 YP4XBgqqTsIW8b/940SzS514lQ6kFUwirCRAivo6lEk45DqVyRUHh36auHkuMF04Sc/AZeBwzLU
 NOVaIosqx7GdGjsXEe/+AD/AnFRJgxK4rpIgP27hHEAjsrZUJW/V+kH4Oww8/Ia1fV67poA9jiH
 WxMxVEX8KXnvnaaGFy+ifc83NkU0gOS8v1E52poKjttilF5hHh4+oUvz1ngx31A6OjT8AcTqclW
 joEjnwe2C8JITRAUQujej0cEYsz/cC5qxMa7D13ea5KeGsosuDuaiNJ/xPZp5KkV/cZCK8iXAQ7
 mi3PzDs5YfEdCkTPKJbNqTeI/hHoUA5IjyXP68OcjLD1fx/szK29ZBvQlQtsZnXKCRiSB4xlC7l
 Tzdp1Vhy0BErP8szehbH8LDu0FDe395rnhua1j7olTviyeBdu7mzxjGwq797YMAoo/nkHpMlSPl
 jg3mauo4Gm68S6cI5xg==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b065524 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_-2Oxswyk2Zu2Y7AJ8cA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: hyPHs2MYwpq--7iwoFofdq5V4t10Kz8j
X-Proofpoint-ORIG-GUID: hyPHs2MYwpq--7iwoFofdq5V4t10Kz8j
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAxMyBTYWx0ZWRfXxfFvj7jj3tld
 CKrZ+YdGtWV8R2qVU9lIeEqqAI8hmN2adff0A3YtYUP7y/KXYRGSC+gEVzjhsRlGSqblIq9vp5N
 GZAJMtTKpsFESet8ejgU08OXiMW+nHw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250013

On the Glymur platform, the firmware reads CPU_CS_SCIACMDARG3 during boot
to determine the VM count and increments it by 1. Writing the default 0x1
causes the firmware to treat the VM count as 2. To avoid that write 0x0 to
CPU_CS_SCIACMDARG3 as a Glymur platform specific.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu3x.c                | 6 ++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c           | 4 ++--
 drivers/media/platform/qcom/iris/iris_vpu_register_defines.h | 1 +
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 4c591538ed82..fe0c91af3301 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -334,6 +334,11 @@ static int iris_vpu36_set_hwmode(struct iris_core *core)
 	return ret;
 }
 
+static void iris_vpu36_program_bootup_registers(struct iris_core *core)
+{
+	writel(0x0, core->reg_base + CPU_CS_SCIACMDARG3);
+}
+
 const struct vpu_ops iris_vpu3_ops = {
 	.power_off_hw = iris_vpu3_power_off_hardware,
 	.power_on_hw = iris_vpu_power_on_hw,
@@ -373,6 +378,7 @@ const struct vpu_ops iris_vpu36_ops = {
 	.power_on_hw = iris_vpu36_power_on_hw,
 	.power_off_controller = iris_vpu35_vpu4x_power_off_controller,
 	.power_on_controller = iris_vpu35_vpu4x_power_on_controller,
+	.program_bootup_registers = iris_vpu36_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu36_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 4ea7bfd204df..b282cebeba52 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -26,7 +26,6 @@
 #define QTBL_ENABLE				BIT(0)
 
 #define QTBL_ADDR				(CPU_CS_BASE_OFFS + 0x54)
-#define CPU_CS_SCIACMDARG3			(CPU_CS_BASE_OFFS + 0x58)
 #define SFR_ADDR				(CPU_CS_BASE_OFFS + 0x5C)
 #define UC_REGION_ADDR				(CPU_CS_BASE_OFFS + 0x64)
 #define UC_REGION_SIZE				(CPU_CS_BASE_OFFS + 0x68)
@@ -67,6 +66,8 @@ static void iris_vpu_setup_ucregion_memory_map(struct iris_core *core)
 		writel(value, core->reg_base + SFR_ADDR);
 	}
 
+	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
+
 	if (vpu_ops->program_bootup_registers)
 		vpu_ops->program_bootup_registers(core);
 }
@@ -78,7 +79,6 @@ int iris_vpu_boot_firmware(struct iris_core *core)
 	iris_vpu_setup_ucregion_memory_map(core);
 
 	writel(ctrl_init, core->reg_base + CTRL_INIT);
-	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
 
 	while (!ctrl_status && count < max_tries) {
 		ctrl_status = readl(core->reg_base + CTRL_STATUS);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
index d21c2070c32a..23068fca5f63 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
@@ -29,6 +29,7 @@
 #define CPU_CS_A2HSOFTINTCLR			(CPU_CS_BASE_OFFS + 0x1C)
 #define CLEAR_XTENSA2HOST_INTR			BIT(0)
 
+#define CPU_CS_SCIACMDARG3			(CPU_CS_BASE_OFFS + 0x58)
 #define CPU_CS_H2XSOFTINTEN			(CPU_CS_BASE_OFFS + 0x148)
 #define HOST2XTENSA_INTR_ENABLE			BIT(0)
 

-- 
2.34.1

