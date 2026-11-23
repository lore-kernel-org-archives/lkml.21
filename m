Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430904;
	b=WfJ3FoKxaNOBWYLjZs+Qw6YJgbdeTtBK1cG1Gva9pq3G9stYCMCkeD378rVtMZigRRUM
	 IVZd01G9+jZoJbi9Fn5uGD01D9UJABajNZ3gr5IVCApWX9iQDVW3vmoUxrilDfE0YNfnF
	 bLcHFDnmT1sMXmK5SRmJHVaDJOihEnfb3vh62XPWITPU2Xa9UC25RLX94u98G8KH/Kbw/
	 8l2sWifGp3jGQji7cWTpduR7h+nF5CR/svg/xFlL8WTSNAgMw5I0HQKShyytTMK0Pri+q
	 YvOy9mWVUm4/lZtU29XouxadWgcGNCO3hB214DZgE03UbMqPB70hqtT+QySJsA10cOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430904;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=A4ZZmj98b3JyuSMaT53nxgqoBSPrVQJ9yUYnbbqNzX0=;
	b=b2WPxEWOYNKnKzIyNDakIrvxLHx0FTYsvja52SZHQsafJzVDvGc0eTUnVVad9mE5E9z4
	 vRsbJ2ThpIIjOYGrg5IbJbk0SUDB7YoPfellVnDW6ate3KKF7LmK5Fo6NynILTGcmIfdu
	 5NvYbF00XJPZ761qEnYl3Iq0uffLfNdA/Txi0SRlc/gu+2cMrOyDc33ArGa/LEQmiB5Jo
	 sSrOUjBk1OgI++t+o/TxLvI91Hb6Evxo1uoJ91xfXkFqlW4xwd+PrPBU3695rjQoImqt5
	 ARAOwpwysxY/trYqD001Cta0rTvZz+6KLjI8MGkGV2wq9eL1D4nrlPMgRAq4qtPMeOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ff2TL9+f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ix+o1GXp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A3B606A69B
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68A3B606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ff2TL9+f;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ix+o1GXp
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9FuL82528041
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=A4ZZmj98b3J
	yuSMaT53nxgqoBSPrVQJ9yUYnbbqNzX0=; b=Ff2TL9+fT1OKjC5ByaS5VBM+lk4
	JW1cagTu6jxe/QdjF6RMcrSjg2LdOXRZtUZaP96WaW3gL/zZ5c1o1sypCjrJhmSP
	UA+P7lnIA/lj77KrD/5pg7hU7Vg4CqMIQMixCdPhIW5krXwL8otD4uZ8GtUOGUXO
	pPL461NhttzWo8o2w5qjo4aQO1nxh1/Pq1H0XqGeumv7U8Gv0edyA2qZWzNaihjd
	RaZQz6MjZSrJ5mckhGRfCoiWIMUn2+uUUIGu5P8oxTcI1OwZgoRvR7GUw0HgwOMp
	UgsKvPnPw5cMOw/otubASA3TYkvm9/Fo8ClNA47/DkZVxUFMEgiRYDvWbZg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7rmmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:48:23 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b647bbf87aso2486012b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430902; x=1796035702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A4ZZmj98b3JyuSMaT53nxgqoBSPrVQJ9yUYnbbqNzX0=;
        b=ix+o1GXpdBNeZ2vgOzSP5/Y6LmN3jxNGdFDMSJgqc/372T8pPlCaKLwz0mYlU8Cw7P
         c+6xwFVM/IlEIRuANgLj84o4HbFynGBy/O5sKUukE0MPVcTIW4IwdQs038N9/IKOi7aK
         3h7+zZJS2qrOEMXsK32vfOdBFbfcCjNPEbriZvqPVTCiWJ4uNLyUionxKc5d0S686pmp
         xXEZWQuo1CDUzrpOxHZTNN4CpYzIkuZn0V/57+4OzpzrOIraQ+4JrvarCywY+qIPouL3
         jsEN8FNQEqjp7fzFk/tm61IsEVCut59/p1wB0PJJqKqgeIZiaqKNTyBWkrIosFHH+mkR
         FqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430902; x=1796035702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A4ZZmj98b3JyuSMaT53nxgqoBSPrVQJ9yUYnbbqNzX0=;
        b=IbLa9K1bsUFox2jM3HuEMDoRJuK8qy+0BIydnz7hKSKpYsor2L0ld1Tu4srAOX2V9k
         /6fhzIhAfsGz7SDd3H0/8cPDA59YfuFb4CSt2WLbnNLMHe6YmMGd38uFCan0rxm2drp1
         3zFhDtXtuY1/YCx8EM8RzFmgsx98J1NCpkADRSlpTbN1Kyd92guxVhzJ8HHlP8GV7BwW
         gMCFQC1jPUbQGMvZ2LXwF+D3CwmDjgNL6f0HKMWAYq/vIb/S0tNFQnpIJvd77kqBpFVh
         cq3anm6ZQaqyu5BnTfzYZsz/0DkaNaJx7E5A4s1iPEx0mSPN0rQaTcFv8duaAbtaA/Eh
         C8nQ==
X-Forwarded-Encrypted: i=1; AL+hErFKRr74ebl/L6bYHV8xgCwMjxreDhG7eQkhMYbubfYYrxXOv+2VAOcLdRsCfQxPuIt5eWxfNF8qi0ED2ng=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xUsfkYy/TJoaba3Stk5Qv4ZqP8lEbqLZNlDlDK2jwJ6mBJduR
	oCO9yGlooWIfXq/gWeyaiuii6kjI3vE0VwU6IbqDmtX6HlGnJVZYy/o11gQwvRsQyStyYro/1bm
	pXAXVRveKwE0Nu+OB6xFKFVYc5kyrgKJohVvw5Qdo11YRQXLPpc+3/heiyIdsqkZjGmU=
X-Gm-Gg: AZFdTZenOmLfbfkHjVW1fBnOUD6wIdZ5k/UiBRCTyW6lfbRxre2LLmnO8zGWTVMmF6/
	h/ZEfCR1g9/fcLbbP18brlK/XB4UTVqB6/iIAKvMm1gV3nRKb0EjoYefTQ+wF41AlPCelM+c3Gc
	clPHJO2aKyG8HFiGaAj8RP40t2T8Gi8VsTqsxgO9KF+sFdb5y8q+EXfvo5I6E/3sQDW/AK9/bM0
	3qjS0eBibQOJrfBa3TW5cv1BdDPkm+jNS2i35+nFNf5krmHj3yiVXI1Ra1ENbEvwq4s3BGso0bw
	x4bqfAivfsxIuIfeEB6A5RLDEmeYQpquPxeGkRYn/i+Rm5+oIUKCRu+a4bkr2/lZx0y2oCkNg5o
	yyrjdQrbGm8JjSsniCduFz2RKnK/jZOCibeCl11JtZHmxfZqFqXp2SQEaRupMI4mTH36AKWq7x8
	AjHDs5dA==
X-Received: by 2002:a05:6a00:a117:b0:8bf:cc92:55c0 with SMTP id d2e1a72fcca58-8c87ca5202dmr9115260b3a.37.1795430902464;
        Mon, 23 Nov 2026 02:48:22 -0800 (PST)
X-Received: by 2002:a05:6a00:a117:b0:8bf:cc92:55c0 with SMTP id d2e1a72fcca58-8c87ca5202dmr9115252b3a.37.1795430902002;
        Mon, 23 Nov 2026 02:48:22 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873442863sm5413467b3a.43.2026.11.23.02.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:48:21 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
Subject: [PATCH v5 08/11] usb: dwc3: qcom: Restore VBUS override after system resume
Date: Mon, 23 Nov 2026 16:17:23 +0530
Message-Id: <20261123104727.1539149-9-faisal.hassan@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b0419f7 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=IFn2jvwIVmFqnHeiHmEA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX6tz+3gzbcExr
 0bh/IJf8k4aPU+sDE3wMqU8KHIzjiK5IcVdQkWAFtxGlbMnNfLVKaf39hNA9hLAShNSJGMibrg4
 hmgyE3yF8GB6o1fzC2eZy0wif1+iX4spNTowjfcHPabdeLIk9P0UWJ2lyDUJpChHIibdzDhKQBF
 RA8TeNHogW/7tKgYwNtKRxvt7yVCtSn/CiCx5pS1Xj9I0bDNxttv+HTVMxB+wJ7gHqhM4/SwQ5N
 sACWQp+wWGKKdl/SW+hDjrBgwUg8P9I7nQrx5VP4hfhxWiV0NJd+WRsrWzvI1UeonZ5JqUQbSIf
 TdciZuSQjQWSiip7pvpIjYLo+ocXth12iLokj5syoc4EWb2Axb59ocSrlDZdknTSxgG3XbpA7hQ
 pIm0w9+1fnqBkkaDrC43EJ2YllLqhKImB5/qFiw+HX32mfC/LAELf8vkayKIggcVjalYau3VxuU
 qnVpdgpP/Z33hA7saXQ==
X-Proofpoint-GUID: _3r7jz6DD-eMpVjCTrFJQHXBCfD3RVBv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX7BO0fyVY2K0J
 nniZvM6wdNwxnTxhIX8r38tma4vLi/ygQGVTTharQbeWN3RgZ0iwWI+w+HxhIc1yuHIlqv9hoPa
 xmE9ZM0uG3VY+i6EKDB/UuenOQakoVQ=
X-Proofpoint-ORIG-GUID: _3r7jz6DD-eMpVjCTrFJQHXBCfD3RVBv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230042

The controller reset on system resume returns the Qscratch registers to
their power-on defaults, which clears the VBUS valid override that was
set up for device mode. Without it the PHY does not see VBUS and the
gadget fails to enumerate after resume.

Re-enable the override after resume when the controller is not in host
mode.

Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 8e8d7e59c6d5..50fca06c83d4 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -457,6 +457,14 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
 				  PWR_EVNT_LPM_IN_L2_MASK | PWR_EVNT_LPM_OUT_L2_MASK);
 	}
 
+	/*
+	 * The reset above returned Qscratch to its power-on defaults, so
+	 * restore the VBUS valid override set up for device mode.
+	 */
+	if (qcom->power_lost_in_suspend && !PMSG_IS_AUTO(msg) &&
+	    !dwc3_qcom_is_host(qcom))
+		dwc3_qcom_vbus_override_enable(qcom, true);
+
 	qcom->is_suspended = false;
 
 	return 0;
-- 
2.34.1

