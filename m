Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795664;
	b=rdMWQZa5okdVWo421lREW1Pm/bYlsGbgCjpGxIKNKqLA0ZOcGMKgHB+HSWuES2FTx186
	 8gwHTAPGOx1xcSz4zKC1f96tZIQIr3HCQFOVpuvJIGEFcAnoxk4ITiA21lAqLlDeiq8U4
	 JGzjon+wRNHnuqFHwqiK84/xgRh8bqK7VoGLwHVboW8HGpPO+Uke07olM/oTZD0CjDSGm
	 Sz1cpmpNDFcvGGINwCJ21Phc8fMqLXqAaNu/JmiqlaGY5lQb3JeAe90xzA+VrtebYWPFQ
	 W5LJN46l4BLzRTNQVKanykBRNcgFabhz7W+iJ+z6qCAXAo5Z1AvC+UCTZ0Fj69PQmnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795664;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EqoAs6H8wdhDTUov2PN60C43VJNKZBwCm869elCtiR4=;
	b=BSxzEcs6lPye6EK8qNMJDfHzUZSWWblu6CQsm11jmFdzxNAP/CXMM0JQGINlAdhnsl5e
	 BwRVIitGg9I9YOsSKoF7BW9QxFpBtk6ZRn41dw/IEKppqEiZsSf7Y3vLzin4oz4rQfM72
	 6OCd8Arl9IwzWxLTkVTy2dvUt86E7wIn7iA92Bg7uf6g3Z5FDTdcNpIjXydeUK+vdZuia
	 dGPj5ZZyC2wPO5YbQACPXioLZvn7Nd2Qv6AmM6/fRGQV5zwlyGWk51E00kr4L1sA2Qbp1
	 af/rsHmjtkx3hM33Fi59EDPcMwkSxi8mgVpo+g2j5BN7p89Ve0F4qBxRMn71cJn2VmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="H/wp4w1o";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mh4dwnb3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C64606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61C64606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H/wp4w1o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mh4dwnb3
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFpW3J065856
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EqoAs6H8wdhDTUov2PN60C
	43VJNKZBwCm869elCtiR4=; b=H/wp4w1ogc4WxlF2ikPS2F3eiu2XZC8Htn+/Dd
	Hz+RRnUDu29U0HK5QRbkh9wAUPFPey13jbKHW2468L2SuPHdSNLriMunz5I2RYgr
	TkSBPw35iSuc9fbtIhneAItlw+lWkZlY8gFsDnxiR3CzHOPWXOKid+MyX5ev+i3i
	4K/AXXurj8iVP9ZcOSmW6VonrkNssybeN8fLgQLAfhwqknhA/tkAHWDNt+mwTzZM
	/kemYjH0YWhuXvq7AbJxv0viDy3S9RqKYvUMICENEb8MT6MADRLWB0b5oMZu2gbb
	x0+O0OnAErqN7yR+uOWh5hxaRTF/N2l4JiTsQNtG10bE874Q==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73dhadme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:07:42 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-836c416b236so120046837b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795795662; x=1796400462; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EqoAs6H8wdhDTUov2PN60C43VJNKZBwCm869elCtiR4=;
        b=Mh4dwnb3NOtr7nPPovRE9gavxte9KhKfBt8PcFSio1/RL/coawOTfusJRQqALp91x6
         Ob2kbhlmT6Ftl3XxfG1en2Ook/bEpM6W9fin3dGNkYWtpIy2j7O98YH4nO10Ppd9z6qV
         WMrXuBsugwlDD0FKMSn3Z6aZNM40Kz75hrEjR0ifBLXBlXQY7CBpq+oqG7q6/AdeliCj
         SzmfrcY7zbeoAVmTfJ68xqF9rK3TV0xVVnVUvE8MoDmbtdXnxBjPeGRf7OqcCQjU65Ju
         b49NyuHWdgXyJPAdkQzSVS9Q20tW5EZSX2/lHagV1SLmxEuSEK80TuLywzZ3IBe8Fik+
         CZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795795662; x=1796400462;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EqoAs6H8wdhDTUov2PN60C43VJNKZBwCm869elCtiR4=;
        b=Z7o3chf80ZZssFUTef1kav3uVvdNUNZGNSi0AMD60Yb+bNCYOMe4HwJJStgmTjNrLT
         wleRa7WzEuqzUstcC3hLRlNG9SixfHvFrGLoDErto8uQHUqlLLcTBCZFMtlF/ToNrxrQ
         mqfXjwvnGFy5sF0mJIVzUa2s1XTmoUYoDqgXY4fB0HdIl81HwHCdjaWNly7i9cFrSHDg
         ycvmyVJbi/sIaGeeo37dbATSBn47owpKm+6gYfUsPoXo70pktTkV+dEjQO63894hlS3l
         HJqspeJekED2T+Op6KA27elO/F1x3VHiJQZwIbk1ptipeGi8WFyRaMTomTK+fT2zlRZe
         OyjA==
X-Forwarded-Encrypted: i=1; AL+hErE2ar7Le+AZZM7JAcv72KgGIM5h73ii+I0D1S25V2ATknMtlI2VRjd6QYGAlGoANiwBrJkremhpX9C3VfU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cVtaSW886fz0DcRc24zWE9VCdRAtwD9TleEdHAwTzzDDR/b+v
	80TmsFJ2/gD9nwPG/t4Y4Tu0D1AnzC7w2tdwWwaTSp7/fUlYWHZY33T94Exlg2Ri6IwoxNhOhMr
	fmB0VBU/SKZ1aDVr+59HZqmjddqM+BZ0CNpMsJItAvLHR31zBkcRtLO+4NjFv2qHIb70=
X-Gm-Gg: AZFdTZenwnoMzMmIAwzHm89LVRSEsya6b1Bg+KG1qBihPecaMuPa+toRo4/savCwv/v
	nwPJeyITfp8YcZtkRpI6NJOoYsZoGUtSMQ/BAZBTtmqXqz6xzGJOpmkUpma/PF8JIyf4lsO9zvD
	4v3ah3XJ/hXv6F5ji0PQ1vefL+Z6EzNyeoAqt8l9/++m3KlgVhUFULrl7hNE7BXNdkxDvbhdhMW
	Tat9siq+/prnL4UEyPX29TRr0ljZQIdqJy8qzY4sLxvQ/wfaXJGvAjHMNvH6fS7Knj7dJbTGMQt
	Km+OI7LSzAKwK5KW3lDYe/OW27l+Gi1pho+3MJmGkFaof77kj5a5+o63mP+VnQVN/HS9F8iaHoW
	gFtosCxBJ+2wZFCi+dtk4yXe0y1B803Lhizq066ViJX5DEowHQEiiYhI4zX9x06/0B5ihE0b4TA
	R4i0NAdNhGpOtg5gsoL+lYsa63U2PiaXsb0nwZCL4+STyBAUgaF2w7mPJSr5JBhzU=
X-Received: by 2002:a05:690c:4d02:b0:8b0:97f5:a858 with SMTP id 00721157ae682-8b520500410mr88485787b3.59.1795795661559;
        Fri, 27 Nov 2026 08:07:41 -0800 (PST)
X-Received: by 2002:a05:690c:4d02:b0:8b0:97f5:a858 with SMTP id 00721157ae682-8b520500410mr88485607b3.59.1795795661131;
        Fri, 27 Nov 2026 08:07:41 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dd55sm46623137f8f.30.2026.11.27.08.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:07:40 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v4 0/2] arm64: dts: qcom: sa8255p: add ethernet nodes
Date: Fri, 27 Nov 2026 17:07:36 +0100
Message-Id: <20261127-sa8255p-emac-dts-v4-0-f0c5a95cc6c0@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAMiqCWsC/3XNTQrCMBAF4KtI1qYkkyZtXXkPcRGTqQ3YH5NaF
 OndTStSwboZeA/me08S0DsMZLd5Eo+DC65tYki3G2Iq3ZyROhszAQaKMwAadA5SdhRrbajtA7U
 nI4GnwCFTJL51Hkt3n8nD8Z09Xm9R7peycqFv/WOeHfjUfhbE78LAKaNapDbLcoOFNvs2hOR60
 xfT1nUSD5nMARaHszUHosNkWQgpbVko9ccRXw7PVxwRHQQjlLSF1Oy04ozj+AJwhyfUXAEAAA=
 =
X-Change-ID: 20261022-sa8255p-emac-dts-dbc521421276
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2213;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=C2c59CwGUVP0632RzJCNnLkW6lmqn/C6S/pQpmYMr6E=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCarKNOPSDhuusgq6UThFLgvAXDa9ybP6t8EoB
 IagmFp6EACJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawmqygAKCRAFnS7L/zaE
 w5GLD/9Vgs8+S03mLc7k831ABxgELeCA+i4hui5iVDXh5+q+dUkZoZjl4ASrs4s3OUKswsCwXzy
 FRPSxSAHDM9LIE2iKgfxwsBCXZCe80S59gWzZXMBQYMM7KOjtCZ7wiWuJxDe8sjjzkyCfvchF+y
 7y3MFDhYal8TN49DGin7mRcsY+lNVWHRGE/MrEstuwIQEro9XYb9O9lc3x8ypvVHs/1NnvA99sP
 cJKF1lBkWdI/y/XaDCdHHQlmTokUQE7P4d/K+tWG1cYNlu45e/EmtQY5oYebHHR0O+rCw5AeIqN
 TIiV/D01Hp4xmIvw64CHZ7zb3kJ9IhyLhg4DBxchVMtY6a1B0AryC8aCBA4bF57n2ZHqQ6TLxCP
 50NqexAtR3IdLIDaxO3otmecwKj54efL1yVgoeF/t/l7YOxQzfybjMN8+xKGskwdRoPvqPiITpd
 sDcuRIxE2SA/it94huBTaMcfUaVb8FUKtDgvs8lTx3VhNL2v0qfkVcwoZUsKbOia4GglkOMCabN
 I2vV/r9iNKqBoJwFzxsd5jZ2jp4nKav0F+Lc8nQv34H6+hP7J0KlEXdYEb89qUBq4jj9rOxj2OE
 Gt9bC2ANSf6mtWE0C3zDij2pDmIggCce2n8n4r/eczeO4Ofd8p6yeAIYhhGrl3mwJQXN6n6bi4/
 z37Jpi7euRAGIrQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX9o75MnrW/cYg
 5wxDPtN31udQyFANNnG5VVrhnJvyhTBY92hEguqhT4tHiw0d4AQskuTx/OWRekcRvlibflisLh7
 J2oL9xZwtWE/Vu4NjIFCoeM+shaugzvhpWZJ2qIxKSJTz5zgUGeCSym6EMslt6fMXlQoE3XJHRM
 h4oIDNyRg6x4sLL4k4fL/SMiuRwKCpybVdMsr0e3dCUouBwVTPsmhRdExfk9pV78iFPMda70f2b
 sLIIOkMneyFdMb06/zZhb6u+Fyo461OVZU8vCYvXGZza11hTn/96Ko0IkcNOJMQg3Oonh00Xhqg
 +0Q6RzWXSAq6yFuqeIiufUgXE5XSQWgiNjMWtzg7xbWGF/R8UUocL6r+uERn/QWolSDbovRmw1o
 G6zvU+MXlAl48PD/TebpH5nLP/WimceMByrCXsKc+yxw9ycdvwpgCEhOzPXTO6syyrDrBYfcIaZ
 7Cp224WHrPxILxmPFhA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX8sINOPObSsvo
 MHx0tGE3+R0usnLcFnbJu4tsM2Aa+5XEGDx/2sxZcK43njKshf1ZhbzL1P80Kh+H1HhM8qmtFQh
 cF5u5E7JDOQLzWdE8J1nskl9RzO6snk=
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6b09aace cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=WiJAuuJCOr3amH6hrZkA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: DcQxt9nHgS5oYBAvxbCRxP4xuqN2U24Q
X-Proofpoint-ORIG-GUID: DcQxt9nHgS5oYBAvxbCRxP4xuqN2U24Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270064

This series adds the ethernet nodes for the gearvm variant of lemans and
enables them on the ride development board.

The first patch is a fix to the iommu SID mask - it was wrong all along
but only triggered a crash with recent firmware. This should be queued
for v7.4 and backported to stable branches.

The second adds the ethernet nodes for the sa8255p SoC and enables them
for the Ride platform.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v4:
- Fix serdes node extension placement
- Rename the MDIO child nodes to ethernet-phy@X
- Remove useless snps,ps-speed properties from EMAC nodes
- Link to v3: https://patch.msgid.link/20261118-sa8255p-emac-dts-v3-0-e2c365d95a0b@oss.qualcomm.com

Changes in v3:
- Move power-domains and power-domain-names properties for ethernet
  nodes into the gearvm variant .dtsi
- Fix sort order for nodes
- Fix PHY label naming for ethernet nodes
- Rebase on top of current linux-next where all dependencies are already
  available
- Link to v2: https://patch.msgid.link/20261103-sa8255p-emac-dts-v2-0-05f9355df966@oss.qualcomm.com

Changes in v2:
- Fix node extension ordering
- Move hard-wired serdes phy references to the gearvm .dtsi
- Rebase on top of v7.4-rc1 and v3 of Shawn's series reworking the dts
  layout for lemans
- Adjust dt nodes for dropped power-domain-names property
- Drop patch 2/3 in favor of overwriting the compatible property for
  the sa8255p variant
- Link to v1: https://patch.msgid.link/20261023-sa8255p-emac-dts-v1-0-a34d778ce9ac@oss.qualcomm.com

---
Bartosz Golaszewski (2):
      arm64: dts: qcom: lemans: fix iommus SID mask for ethernet nodes
      arm64: dts: qcom: lemans-sa8255p: add ethernet nodes

 arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi      |  34 ++++
 arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts | 199 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi             |   4 +-
 3 files changed, 235 insertions(+), 2 deletions(-)
---
base-commit: a9c48428cbd8d96b26f92631d0db6f8519c5fcc5
change-id: 20261022-sa8255p-emac-dts-dbc521421276

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

