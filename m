Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517594;
	b=WVSAEWSYUYr/jTJhqzLZJqC7kzEnwLSTIEliTtOLJ46uajpxkZIBH8j3qENxeGNZxTIH
	 LV33eiT6Tq3EU+tfiMi3oCD4i0cLMtXSbx/bBqy6QAbbRRYOv4V0rtZvf7RFkJhFYm4W2
	 smehjQXQfzXtJgEJkyW1nP/etliTY0svScbnNt7FpRPHmh38DFonf6jzZZd9Bog4/tOSR
	 byGryy9wgbLxssc+2lj/WkeRafaGxuEWWXX8/WLbf5w/5zf6IbfD54WZJBfc1+XlOlTsV
	 eQAM1RbW6ba8U1vSinh5/QWA93K9aLJQG6rmYDCQgIRX06ZAuFa+RuKrG1paWttmBfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517594;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ap4DOcLXbm1ZCm5Pn5mEyh70hb4RUeeOFH8Nb2PLcPQ=;
	b=FRbjufYYTk5BASqLQjpFvHfduco0nwKrN+9O/Q/VNMD7UvjLr8gd0q0cG1nPvWNpGOKH
	 663BrIndwTTCbQW97jyyKqJk2rI+DseEP3CJVhM3SrnU3CbUwXaMFa9PtNTIe+ZDeMz0d
	 3IeDdPI1deeZrNijBTQ2aCqFGHr0rRuManjrt21DmHpGNPU/vaVPrxz8T2PzJzXtAL+uw
	 EWrK9Dcjffh8ysnccjGVzda5rfo+Pa45sY70D86qTZk20rKo1CvlME4MVg4guoyNnjDnY
	 N5rQQ4cBh0sUFUbsiGZk9PtE4nYLrOCkHlRTgsdzIT0UEr12KeeD5/una6ZPba5JGFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZcdjbbCF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D4CDLqNc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2205B606A327
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2205B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZcdjbbCF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D4CDLqNc
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8OJ6B901979
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:53:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ap4DOcLXbm1ZCm5Pn5mEyh70hb4RUeeOFH8
	Nb2PLcPQ=; b=ZcdjbbCFeBkHeEdI4eqLkIstKBiJ7lJtG5BkB/ox7z1NZurQrYQ
	Oh38tErfA9R5OebUUn+a1ZCve0EGK5tSMLpKYKc84UzjjZ424oUQ9Z6CSwnDc3Hq
	xSkoBdaSa4H+Gq0opVvTTAs2V1tha7CUIkfSUO9G4G8hq/5KqRg2LKODwJAI/OjJ
	X3B/whVU3ct0X+/eYCoAaHvb+iyvn2lB7k1VGJ+W4o26u6S8etmeLr27/iGS7wUZ
	owrih+TJuKGdnihPc/OXb8VSUPhJGth8e56wvyRT0tvKz+dk2HSzogznv+NcyOpW
	fqGOAHZkqCxEgS7C6L3g0XjIzvQN+GUKlEw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4w6stv42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:53:13 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so7128301eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517593; x=1796122393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ap4DOcLXbm1ZCm5Pn5mEyh70hb4RUeeOFH8Nb2PLcPQ=;
        b=D4CDLqNcrlRgIfEsJKBpsgKqGbcP1hFHAzw8oJSVG4n4EpkUo/VUsJqjTLyJrAHEZB
         RMpRloGUE4caD+E4ynbe9/Bu+Vfx1FChoTORpiEL6iGMaFG+B/mTO0Oy+LRsWgXJmOWl
         jI0YSlYEYafrcAmv4t7hbLGa0qWyRGsgFB1gjWRIODyewj/I02gBzc5p0t3z5JQC4s/9
         BQLXHfAmuKoiJ6Uv3pBb3i0HAzhz+tAje4c4Po0FKPg/MORFijiLfrhoDXDFpZ+E/MJF
         pBgfApEdwP/OoaeZcLYyLQck9/g3NQvh7MiitqQpGRYoISU2oLE5Q26UhSyZq2Ah1mP1
         s2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517593; x=1796122393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ap4DOcLXbm1ZCm5Pn5mEyh70hb4RUeeOFH8Nb2PLcPQ=;
        b=Qqs9I3XDPHDeDC+bOeoPiaPKMoBXeBnTmupY87cL36fIDeQxLlkoEjgtSz+cCh89be
         59YfE2KnL/Pg3niLv6bJM1TaQzvuCN/n52MRVC8sd+2RAiv+56vplwNawG5Tjmngz4Jm
         EdTmcdRN779Q9icktlgXt3cmdP/68CK9j3DSV9TOMUDHMesL28j7mg6AiAseWqVwcJDQ
         pnlvbe183dd/2I6r11GXKYuYKnt4DaJVYa4c119cnQAPMrOK+01c5ZQoVC24Zh+Unspt
         5UGmeRM4xaKvqLXfRQeTz+saoXP+m0Iy9aEZK8vnkRnqYMhPfSwckE2ICYu7Roczh6Sj
         oZow==
X-Forwarded-Encrypted: i=1; AL+hErGEKS0Yi/XW5yz2pJuAv4XM5jBhLCJJmWquGgUwM4R+sDaEy45XPfv5TSjxXK1hl4vP/qkVd/hHNMWdjdk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0dUVOxNwe7wyaaHUkg6hwXqQrKvElGnCWIRHZUaVHxR/8Y0Pt
	406xIwJiSaep8j7j7Mg3yi6tDOMvO8dIO/svn1PBcWM8bA38e1majH0xOguVTzeBWBhostJpiHk
	FuyvCqYmsq/+TmFvWsTQXNNLTbMLrLX184TbLkb68OIpnOHkW7Wv63HpZPNBpNLCnsb0=
X-Gm-Gg: AZFdTZeYhIrAFFjBCaUzbEPCiDwZYFEvbq8wnL3/6tpNKkLuXgDDj+HRbw/vVOb4hYV
	IkGTCcZ/pzXCEDi9g6q0yhW/OafbaKg8A8uWHutVOg+YvdJAZzfXvihxwBzLo7v95YvtLqP5XRx
	hAs6l1PH4qjZlZaUHmukl+PmALmAIqyDTd5GctJsa0A4hg/ouXeYzKHxjI7WsXfm435/ihi2lxG
	m2NQQrJigGn/Dbi8clMesd05QrSiMW3C2zhAyu3YdzRnkIdxjqRtEaGPYQGStZfXE6rMV0Hcmfw
	cot5fxOcx+5veX8lNO1V82BLHkPaldX2QcjbgvNsilB2Pz6PdK7ojaNP/6p1qA2pI3objh7Bq+C
	bU+8Vv3CyVDzDJ359E/f5nTV1EGmET5+Alhq081bhUayjuPiqrxAGlL3WI6FPgkYDujTywZWZzF
	fYnSaxDu+zc2t9TxyKxt0ug+ONZC1DOmW/JkTplJO71bjeUqj41IT8ngA5
X-Received: by 2002:a05:7022:b058:10b0:1b5:330f:6209 with SMTP id a92af1059eb24-1b5568a32damr14232610c88.20.1795517592573;
        Tue, 24 Nov 2026 02:53:12 -0800 (PST)
X-Received: by 2002:a05:7022:b058:10b0:1b5:330f:6209 with SMTP id a92af1059eb24-1b5568a32damr14232592c88.20.1795517591912;
        Tue, 24 Nov 2026 02:53:11 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm35075998c88.12.2026.11.24.02.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:53:11 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] pinctrl: qcom: Add Seca TLMM support
Date: Tue, 24 Nov 2026 16:23:01 +0530
Message-ID: <cover.1795517583.git.yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-GUID: kNXKkImiHGSJcTodsbOJ4YI_X2Flp3DH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX9L/XAT2mHawD
 M6qJFQqXaH7njTIsOnTGCzIO/AjEzM62SfVWvnY27QIsYNE1CMRlRH9deicFsgFDDcDm2a4qDvo
 Ke/AgrL48taUo6UQ+I4CyPxy28fwNh8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX7BTAMHh5Gzth
 G2VeAdAsI0mCFr8Nfno/6Tq4JEAYQZDSgrdjxzxS+4WetqH553gDt3jfdBDloh9ve2qIdVZ01mG
 6wOkoh7JSJMd1Xvz7KNJfNbg/b+8qsthvXW2L+eJY/6P6jEnzWocYdToAbsLVYiim39VSItLAJa
 cU3FBZAGYPc32FExjjEmjm5H5XGiaDnqdC28X7tn7d9VBJEN6OKadcwjcjtqhn7xHQrjxB2Jahj
 jo5mqHDbNwJ8bhuJodjSAiAru9ol8klAv7baGOA8iBHnokyy4yhzGbFIXYXRN9U6bMnNeLvXSh2
 +VuEZKz/lOe8uFL3AMjMAXVSQhIUwL5APfP34Ony6wIk98hSvTjd9I+0/w/8z//QXoxntPAgCNj
 f9pFjv5DbYZoJKG3KzuBdYsucnrH1KevSQS5Pk6Skx5Domtf24e6BhByzRtu+equ4QszbxZquvz
 nruhnvcteEzGgN5GsGA==
X-Proofpoint-ORIG-GUID: kNXKkImiHGSJcTodsbOJ4YI_X2Flp3DH
X-Authority-Analysis: v=2.4 cv=V8DoQuni c=1 sm=1 tr=0 ts=6b056c99 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=lHObh2IfMKzVuqTG74EA:9
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240042

Add the TLMM pin controller binding and driver for the Qualcomm Seca
automotive SoC.

This series was prepared with help from an AI coding assistant
(Claude). It assisted with review on the device tree, bindings and
driver (formatting and alignment fixes), rewording commit messages,
and running the validation steps (checkpatch, dt_binding_check,
dtbs_check and W=1 builds). All changes were reviewed and tested on the
Seca Ride board.

Yadu M G (2):
  dt-bindings: pinctrl: qcom: Add Seca TLMM bindings
  pinctrl: qcom: Add seca pinctrl driver

 .../bindings/pinctrl/qcom,seca-tlmm.yaml      |  135 ++
 drivers/pinctrl/qcom/Kconfig.msm              |   11 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-seca.c           | 1705 +++++++++++++++++
 4 files changed, 1852 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,seca-tlmm.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-seca.c


base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.43.0

