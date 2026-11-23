Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430909;
	b=oTb5gQQNc8friQRILAGwFQPPofSotgh2VLXaO53Vo602CBbvHT7y+f1egpQsHDp0yoNr
	 TvlorOVj8K1duN5EJasuU5/vw+oJ5x8yFHhNkhmItSX0IPZCxg/zRsJMd/CdsLJ2I5+0A
	 TGeEq2h3gy8VeW2JApZoEAG9HmPsCxjGUmcQOrMkgh7L3dDVumt4awCnbQyxIQNDKPPE3
	 k+C3jNfku0qybghk+3+sXTEJVQ+1wztOtQ9YlqrroggJcBn6+4868StSJ1+2Ws4wsVl8M
	 G7MHyUcJO5T/w/UuaY8vRddViMJ2aCZLWWiTlfh6I3M52pD84mP3o6IPl1Wov4ETYlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430909;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AxA3UDwrCLZ0UoGL5laAO3ydVWCTpmg79oZ19pW+sSM=;
	b=IR6oR+Kxj8tiOBobmzqmrkesfXR4RCTef7gxri/ut2AnTMkTTk2S5DFyQJ3/tzlwtoNQ
	 UZo/fLavSdmCHI0POLqyuAZDX7zeWALqog2h/kdblp9HCaZEk8rJxOnFavJ/SE3pSoVFr
	 mrWMX4deT/nKmkPIMqhGp0l4nH10w3/PxCDagULuSxo6vQpUyhXOv3G9ebK4rvNyxUUHx
	 q0ypu//E0ApFawxrMGqk2VUDk8+vnwtUGxxh5DOQDckk55p/CcJuyWHHEHQ4I8cKol5BQ
	 cNdWMOOgpCdlrgq0D/SzoEjM8B/KApRqOei+vbW450DS6xxDM1YkswbLq72did0ANHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ng0D3ywK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bdFiXysp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CB9606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:48:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16CB9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ng0D3ywK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bdFiXysp
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9G9371397077
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AxA3UDwrCLZ
	0UoGL5laAO3ydVWCTpmg79oZ19pW+sSM=; b=ng0D3ywKkLAAHR6Aox7XLN7nmk8
	Bu1oLsf6n6N/Wgma9fJOyBWpRo8paRypnY9dTERefkI15/tPzJGOUemNzw63GG9b
	D0bkhnP/qKymg/iej1DeAZYxVfTJsFGJPIvGK0NSugljDjjvLkwvilS+fORTaUSJ
	WdV+7XJtez92Bq5Rn4qJCFGUO3XiJ7ndfuITQVpRalCjV7bn95Cfe1H7Om8i7TUI
	caMg/sHXfG68SPPH4YEdJDNTUzOg1Ouq3VPBkGu9ZiV8dmUVQ3siJa5HADQYiqKK
	5fnE+2ZkPJEsXzHK0nLk3ccIZfzwsMUsN1+eIHO8b1z1eWz3lJHYeBJOEoA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx17qx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:48:28 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a065e2933fso3636604b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430908; x=1796035708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AxA3UDwrCLZ0UoGL5laAO3ydVWCTpmg79oZ19pW+sSM=;
        b=bdFiXyspaspYoUarUwQXLCyZEiW6uuH3wWijc4CfHakGn7mURPUmwykQPArC5U3IUh
         B3iDdX0r8qSwlNd0btSHI2Lmo4O9kfv/7iKvJds8FyYNGl0PRkaRWtzSbcjZk2gH0ioB
         Vm16JqW/W4F4VTQ8f1HOhDrurqDSJ5/ZEmPfvMaATvxUdnoPscBEqon9RH30+RemRRUd
         QQpx/BlXbSEe8WVOp5yCN1XLA8skfKp/N/HIpZMcymFvTpprCUHkM9ziRJPxfJ5r9cpX
         b+LiANTyv6QL1kqVHbFw5MB4il3TKXww1yrCTyPOqsPet5YIGkGZGA10zRRPRHQvlwUf
         rvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430908; x=1796035708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AxA3UDwrCLZ0UoGL5laAO3ydVWCTpmg79oZ19pW+sSM=;
        b=B5IEgoH7KC52LhAApjJFNzyKzeZ6IcP2Vd1BAflfLo/dbgun9HRxcSv6ipN6czjUBK
         3w75kHv6rbdLbmMB8ogSGr/dumjVTllGyA1qe35G81Ol8jVtIYU2fHcy5t4PBuHxIXJm
         VxCcnumls2LDrQzeYS9hA27Qci9aHUi8RcvAGPDLjmkEH9xzhFNvYM3T/sGLZ/2R5/LV
         bo7JM9p+kt1hRPTu5UME03Tx63yf2aOxPb1lAUtPROVgOq6I0ssWW69gdeWpj41RpgUF
         RynH7OSsdp/MBQ99oLdDHik7dABnCYbmE/rm8fSlnq9/ZbET4ZkoCC2DCPKpaLQDJAn4
         d8sw==
X-Forwarded-Encrypted: i=1; AL+hErGWaSNFZzRTZVFKorh9cmUS5z/pa0xtx+wNqfK+Mu4EjMK+6M15w99J7fBlYB6gRRT5s4j5kENdQHRnxzk=@vger.kernel.org
X-Gm-Message-State: APuU4Z83xtvSmpR/3VKQC6HON9V6uv5GJNJSJT5L33Fl3wJDvAunRLHp
	CGV7Z6UsZC5sZyQTb1DJpUFUjEEZPP4gwgFzQrpunw11jtt02ithHG4Qmo1v/QAgtFy/dwTBN1G
	AW8SBsRHt1FmnLnVYHDRd2FvXig6/Hr9KR0+07Ox45YLhWSLtn5xOTQZ8qaxEb7rrLRw=
X-Gm-Gg: AZFdTZdsCLkJs/FIydMky1j7Kwyxx6lJQVMD9ukKOzFYLFju44VjxJJRMTjfaw5C5w5
	97/CWbNK++cgvN8iuDTnFdSRqS492GJq8vkksKyMCuEsNjxQRlwdIV7dlK9EM/4zVNV8X5PJ9H7
	i+9kiQj8t97DqyltWC9RSPTeuLe08n1YFpeJIBXuwnYbSlAL7dM0hSJpe5zwShB2cAlLQQiuCty
	jFO3WAxVDUic5EkLxmzs4o239xe0G7vXUF12sj6AWI60jEUPpAm+E+WhERw7srm0QQB0ID+qBvt
	kfreclPeWCSaQCXlLNqAa1OQIdjnVi5EmSueXP9M9l3dqWq2TUE7md6z+P3ec8Ropnh687jz7c2
	re5CF6sP3VuOdrd5BvLYnW9f1TNlcBNxDPLmwlZIjV1yeguZ0Am+loFAzSgB61FEybhUzv3IKNG
	Xf8edoVg==
X-Received: by 2002:a05:6a00:1255:b0:89a:19ae:10ed with SMTP id d2e1a72fcca58-8c87c291f79mr9890486b3a.31.1795430907684;
        Mon, 23 Nov 2026 02:48:27 -0800 (PST)
X-Received: by 2002:a05:6a00:1255:b0:89a:19ae:10ed with SMTP id d2e1a72fcca58-8c87c291f79mr9890454b3a.31.1795430907176;
        Mon, 23 Nov 2026 02:48:27 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873442863sm5413467b3a.43.2026.11.23.02.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:48:26 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
Subject: [PATCH v5 09/11] usb: dwc3: qcom: Assert controller reset on remove and probe failure
Date: Mon, 23 Nov 2026 16:17:24 +0530
Message-Id: <20261123104727.1539149-10-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b0419fc cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=SipdNjeEsZ0rhQ0KXr4A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: O0D-8xA84tW7pfwR-nQ6EPQlgqnB0WXE
X-Proofpoint-GUID: O0D-8xA84tW7pfwR-nQ6EPQlgqnB0WXE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX1j1tKWv39JkC
 TrZMce9gTnWhehM6oYJvfg/8eLC5bLhfgthhKgWT1M8IkU1H/BANHxsPBdnRNKBTx4zDw1IuVnX
 HkQTG3NhVGO8a26xxBGGzSqlvWXevdY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX4wQMzDyGtutX
 N9+086lYu0Erjpr4KaJQGE7ou8tqcxthVDdvlv5OYYKLoXNrambfU9ZzpFB48U4AhRcKhfcTCDi
 DlOzPAW76bomF5hFcXafYMJc6jlE/OeiZmN+by+Uxw0ghCp4j6J/2DR0/pADebUCqTdl4+AwWW7
 K6thG1PJ1XUlFtOqSwsqcykrloAblQmcPf6BxCgpXd6rkT31WInlTBIhS1zrMoyPFuzE0dvqqqd
 FjDiCEG+bo5X3HJJBkoE9IRnY9T9S6J0M3urGon/A2jmedh5B4m3y8rDIGaws57sMDajmtY0p1P
 IjYdWToDbUPhWhFcE7TUuAiNOPymJCIpd5BQ8ezxN/fsVDB7X4XKfzNDlQY9B5dgLS4AKUPECxp
 VQhu/czjtJFrXWLYni2mw9ZydgdCxazdp9IG4s+e8/p1/goZduTIkdBPc1K9gZRCeh+gMWC40hv
 l9VqyWIJ7rdMxwoYSrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230042

The controller is taken out of reset at probe, but nothing puts it back
into reset when the driver is removed or when probe fails after that
point. The controller is left running when its clocks are gated, and a
later bind starts from whatever state it was left in.

Assert the reset before disabling the clocks on remove and on the probe
error path, so the controller is held in reset while unused.

Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 50fca06c83d4..61a3e3c38f59 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -804,6 +804,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 remove_core:
 	dwc3_core_remove(&qcom->dwc);
 clk_disable:
+	reset_control_assert(qcom->resets);
 	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
 
 	return ret;
@@ -818,6 +819,7 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
 		return;
 
 	dwc3_core_remove(&qcom->dwc);
+	reset_control_assert(qcom->resets);
 	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
 	dwc3_qcom_interconnect_exit(qcom);
 
-- 
2.34.1

