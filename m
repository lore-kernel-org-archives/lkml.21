Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795077836;
	b=A4vEIN09BVXFFSeCK/zaqMKbcx0qHMp9MptMJgCoJZd4mghyNwxe0cJYbl82cjBRZCIv
	 8S+MaSKcICvoDzu+iSiPm/Q3bwjw18xd28aQxgffnMEYzrHg3YnKcAWX44PJmF7otiKLb
	 7f7DbOP6PBF6bPg8gzsPYfRQvwhBsItD2vOuKebdWqLRZaPgC4Y5yVncBZLWqMC8kHX6u
	 Z3jaKJanU0XZ15R6j9WgIJv9wNxG7g+nkFdrXaS/EXWqF6Rrkz479tRx900Uz6An+LYzE
	 HvbH39vIomokTWgeyec2R8s6i07SST5HEw86Ie101XPjAYKnVFBCPT1VEi5PCx1ghCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795077836;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JazLB2oOS7FZ9R+ZOVhTAWbJ9ttNHUoU7vKQ6VHbWMQ=;
	b=GI2D/WEwPAgzzURXt94aLbqO5KGezQfHsD+5izzOPeD4iZhQrbJsQD0czAVSNF4yuUxy
	 VoWVUGs8eeStQR0nxUVXzxCBTDvkE7lkdiH6wLH5Uxc921Xvl5EP/yKjSqBPL+i1gTGaL
	 QHx5007tkV6ePH08usviVy1/FznAkAWB82eZ+Ak4AIOwTBHjmruzcYE1k4qUNmjpz+zn0
	 nCuwqJOha0RBFyIrlmhdY+0vWsiQ6dt2RJMey42w5UdUw9nRJpc/5CVWHFU9UMn1Hmrfz
	 VIlLexve3PPonsa2u0NrS3UxZ7pjATaL3yPCv0WcYojrjIpVx9W1W/eJHlYOkixpoYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HOwuwGlx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kwLuzbyI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8ED2606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:43:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8ED2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HOwuwGlx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kwLuzbyI
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vRRm2671943
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JazLB2oOS7FZ9R+ZOVhTAW
	bJ9ttNHUoU7vKQ6VHbWMQ=; b=HOwuwGlxaI4tPTSOcw4/6IBfX2PXYeYiI0zQtQ
	/hFVN6BGa4Xj/vjumZNtDeE03m6C0r5pnMj6h3SZw1LWZf65sd98ODuKqPAvnNJi
	BWsgPsel9BviTG+E79UVFxJVFzRhxNKCwuTCsFOqEaaTe4LfgcnH1z3deewYqEzj
	f8sjKa6XGYnIlVt7LmT2bo+PF2QkAm96zb5IDiXm8pHfJdIobf2FOQRkLngGJcU/
	aandX4K01o6a3jxOEQPhJtyycE4tW2249/3jiMZjERlJHx7NxXwaMxudf6/jHE3H
	00hZV8lOE27lw6gDuG2niA0EIRucmjLao2XZErEAO4Yqmcww==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g9p3jhs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:43:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b3f3e256e8so957552a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795077833; x=1795682633; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JazLB2oOS7FZ9R+ZOVhTAWbJ9ttNHUoU7vKQ6VHbWMQ=;
        b=kwLuzbyIegtD9dmcPZ3UzbWOE0o9s7DFvYdfZKRH6ed5t71komwfVDzs++U1JDKKpm
         NpaEfdLFNVvZ7uudxDhjIMmyO1BUd/XCB61pWxDzHW2VsQA6Z+Y2qBUbx3DAhl9BpiLy
         SQAdd8ZUCAI/Q2WeXuDj5eZ9OaHtnPxhhMhFJ2B3qLGyUi2xvS9Z+sY/m1ITNM0DFmiW
         S0ZGI3esrI/xDssTK+24PovH+709vkPj9jJcsvXwO5Tth2aWQqC1SDTH+B4bF22gk5KH
         Ig90gzG79tLANbDM7LtvFmxAmQQqA0MC93rsuzxLyDfYyZlau12DrfNK97X5lqotMRoS
         GFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795077833; x=1795682633;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JazLB2oOS7FZ9R+ZOVhTAWbJ9ttNHUoU7vKQ6VHbWMQ=;
        b=d4XenQKLSu61oXcPZGtOS1nKraKvjxoIa68ZP/YRniEt5M1gCAO3C3ilKSEYSX2q2W
         Ji7W/m1dyBbtq27ZtKxXJzqN7e6dKe4U8J/Qn3n2E7nWzojnFpY0Ek7AB280TVcgY2f3
         RxOR0H6+5cO8Cwk5d/KSbVSBCXwRbZmpMlwU6afZPPL9mB21TEeFDj1PFBM04HtFucgt
         aET+jUv+zHe7PCrXc+chAvoeEf+q7OiK3NH13m/K3kPcP4IAzclj9HcgKtQUOGwzHXAd
         LG2qe8Deu0f1WZ3y585xniJ5mCiIDTgYucIl98CEcqKIlA2i1tTj9z/zgeGbkRFNPIId
         pbRw==
X-Forwarded-Encrypted: i=1; AL+hErENrd3E/HJYs9RCEx99yi5b7Lp+FYhru1KbdDqyDmQy4WcE53iKwCySbTpSfLAmPVM3/w4RIkoPgmwDnlI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/edRfqF29Mn3W9UlGyN1ovq2X8Znf8/x7OJWKJGiW4+yWAi0Iu
	rh2nVrJ7Z6pqflceW0AlvYB4JXIyTcjCNMePcmurHQ/ACgIZFzvUGitGAVfWx67W91jiyiuqVDd
	suqz695zIy4ufuqdE2r8AmeJKWZENvjyg5gWx2undXXDbMddlX1yJ6ZsHYGw0+mmhZD8=
X-Gm-Gg: AZFdTZf0H6LyexfpuwLntpiVDyI9TSrVREdM4FCg8AHDUIq+IHJsJYTg8WtXuFdoIX6
	qmdkL0OOzjFWzhHfkpN6bI6LpoJSRSrlKLJY3dR/xH47RV41ZBXEf9DqWSuiIlsLlMBcT74ABlk
	wRy9lVaFavg7mfcBMt4vHKCYxZlT781bNXtrCoxzSYSpsvBkkc/mv+SGvyC2mayjCghxJdKRbO2
	W7+WOOEmvQFfVzoRKsCNqhhi/37H6ydjbH6Z1ts945ViScu8twdiSpJ/OUlNULaLgQznqCt0IXq
	R3l3Zd9aTOP5JowmspKKjkQ1/gOOa9aivS1Yd5yDXT/uUVoiIsibcufVvsPCIJnEpDIGw8eK/Os
	CdFa0brBHoRixxbiZIWUriz6PZjO3jcjpVEPCcwDnupTIsA25KsrwyKaBbm9piRz0K3+xezn7yD
	epuLFLQCrWDWqqxqAuACoHjszvjvjGQ6xtrUWhRwP6YOKc50aloVNFJaxc6h2bYwN97zSnf1Bu
X-Received: by 2002:a17:90a:e7c1:b0:3ac:83c1:2c0 with SMTP id 98e67ed59e1d1-3b3d07e3cd4mr4990995a91.64.1795077833513;
        Thu, 19 Nov 2026 00:43:53 -0800 (PST)
X-Received: by 2002:a17:90a:e7c1:b0:3ac:83c1:2c0 with SMTP id 98e67ed59e1d1-3b3d07e3cd4mr4990980a91.64.1795077833044;
        Thu, 19 Nov 2026 00:43:53 -0800 (PST)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecb486sm1607880a91.16.2026.11.19.00.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:43:52 -0800 (PST)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 14:13:47 +0530
Subject: [PATCH wireless] wifi: mac80211: Handle AP_VLAN in station link
 changes
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
Message-Id: <20261119-handle-ap_vlan-in-station-link-changes-v1-1-35f1396f5a4e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMK2/moC/yWNUQrCMBBEr1L22wW30EK9iojEZNTVEEs2VqH07
 o32c2Z482YyZIXRoZkpY1LTV6pBdg35u0s3sIaaqd23vYgMXMsQwW48T9El1sRWXKkUR01P3iD
 jzksQDKETCNWzMeOq37/oSB/NiDCj07bY+/KALz8PLcsKwvtSx5QAAAA=
X-Change-ID: 20261119-handle-ap_vlan-in-station-link-changes-5c1d1e9d51e1
To: Johannes Berg <johannes@sipsolutions.net>,
        Muna Sinada <muna.sinada@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: DHlnLu8zFSe5Xvy0o9urREhi2VE9Qh5C
X-Authority-Analysis: v=2.4 cv=LooHWXdc c=1 sm=1 tr=0 ts=6afeb6ca cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=dbWhoCd_LgUf9jV8970A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzNCBTYWx0ZWRfX+yR9NYtjnCRV
 9SNGh+ggUSJ+AOD3NaYDgnmd164JVAe2L2OCp8eu8ep6MUUAzMBRgjulu0Qz1FFTj8Uj9wF68IJ
 dqAL8XUcJypV+ecRd9RVkcPtvByaGgAwzjHix1sFTC5QMsmtLdQxlbxFVDvAPqwlXpD0nlmSZbC
 kVGXSxxeexMlLMsB67zuR33Tewa8y9gG27M8MrirdEgBs3kVsofCTJ9UylyUPYEREAah2CBMJwG
 pSI1I5DLLCLmGy58NT17l8RdtTfZzTOnVM7V5f4hsM3Dt13YtUAsN3iAis/h+XZZIL53h5JInVv
 2ZST3fqjj5qDXqufZNDUtXMhn9PRD8sxVcO734hxnPVg1hjQDpsZnS+acv+RP/rFi5fu4wTYJum
 uz+TvaeoGHhC7F1q9R3elIvcbj60y33NHc9quSxIu7Za/h+bkxNDh94nkFModCP+YwmGdoR/2kT
 00akLGieWdWZaUtGhUA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzNCBTYWx0ZWRfX5hIXwS4H6FMO
 mTZ+SuKe5526Jx7Kwcz6z4XkAu0wJC0MyYjk9GVm7AwTSoteJju7ytilPNb/oz7Hhhp6pN3XLQC
 p5gt+6HdEtVY1ciMFeiKhgAQ2Go4+Vs=
X-Proofpoint-GUID: DHlnLu8zFSe5Xvy0o9urREhi2VE9Qh5C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190034

When removing a link of a WDS MLO station associated through an AP_VLAN
interface, drv_change_sta_links() receives the AP_VLAN sdata.

AP_VLAN interfaces are virtual interfaces and are not added to
the driver. Therefore, IEEE80211_SDATA_IN_DRIVER is not set for
the AP_VLAN sdata, triggering the following warning:

WARNING: net/mac80211/driver-ops.c:597 at drv_change_sta_links+0x121/0x235,
Failed check-sdata-in-driver check, flags: 0x0
Call Trace:
drv_change_sta_links
ieee80211_sta_remove_link
ieee80211_del_link_station
nl80211_remove_link_station

This prevents proper link removal for WDS stations associated through
an AP_VLAN interface.

Use get_bss_sdata() to resolve the parent AP interface before checking
the driver state and invoking the driver's change_sta_links() callback.

Fixes: 90233b0ad215 ("wifi: mac80211: Create separate links for VLAN interfaces")
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 net/mac80211/driver-ops.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/mac80211/driver-ops.c b/net/mac80211/driver-ops.c
index 0e854b0974de..f810df400f6b 100644
--- a/net/mac80211/driver-ops.c
+++ b/net/mac80211/driver-ops.c
@@ -598,6 +598,7 @@ int drv_change_sta_links(struct ieee80211_local *local,
 	might_sleep();
 	lockdep_assert_wiphy(local->hw.wiphy);
 
+	sdata = get_bss_sdata(sdata);
 	if (!check_sdata_in_driver(sdata))
 		return -EIO;
 

---
base-commit: e1dd8486807c1acf9551250b7f81e116a21e6ad6
change-id: 20261119-handle-ap_vlan-in-station-link-changes-5c1d1e9d51e1

