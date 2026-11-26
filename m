Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685800;
	b=xcHnyilI7RBf88cl5h0YUpZrTZz2rWXscyRGYa1x/BGYF2HuodddaTulD7g1pu8NZHNy
	 z8+Dk7FFuQ869z/XjwR/fs8u95s8gw5+ywIKRWWjRSb6XUyZQD48qrNylYQ+HOkv9/9if
	 TbMeWbMFxhJt94/ayjofVVsC2FdZO0SK8CkwhBLk41UGzWWtdfOy/YqNBCXs4mhn5RjH3
	 j3z0DsycnTzwt2cReGB/q16atPqJxL1J80OntLLdkxWQFssGAFPA5iss2CFVNUt4kz09g
	 2NKdHtiN1PzsI/iZlxxpfWa1JQiOvjaEbTxWK2dkUJTWYVTaU1HpQbkATO84nyvg52Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685800;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=;
	b=nUi61ezheSaKVgHFXBPDSwPXq5vXk08FVpkvs/Ckloyo20HakduSWW7pPLRAA0WsQ2Mw
	 yUxsKAT9kDqxIhz0MPPzky620ulFDTgN2+g0o/OA6ZB2y3ZgJ4b8EhErKUCpTOvUrfdML
	 C+LTi70zIrBT4W1HHAkyBcpVn1VMTs4dUsY9QXHK0SDEvcVisbooduZ/Ft8gbTe1OkF8O
	 pKaSQ/vnGaAtD70vZKZ+TK8uIn9vM/7h/fMrd4qAx/17gqeVIk/TIyea/X38YSjHlq5Oz
	 KI1hq0r4HDGslYP/sv0O1Ee94vgc4ngOhd8HLuQPowfrZJrLOrPfA4S1lv24Icf3cLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dMy6Z7LM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SopBH1nE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51ED6606A336
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51ED6606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dMy6Z7LM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SopBH1nE
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B4Ug2595120
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=; b=dMy6Z7LMWwf5pGPS
	2AZDGdNSbEwYP5I+l/u+WYa/K+2b+NATEAdkvID55tbjesDfb/Vh9ivf1fkK60uz
	ZiOfh0NSJuoh9L5qrNZ4sog0LDFeB35YDjoDkzds3ZfscSLV+W8RE+ShKgB0+7x7
	9Cc7yeOJF6neNT+4s6w52qh6oeUnWo9H+JxLUSBIt2EJmygnK3DOOH5aVAkRJxpX
	R01paHjxLpYs38GU17uT2h7UvBz+2rkdiahWwX/U93IRdvKZfMPAyjCdeboUFe9e
	ukIHNw4JQcZ/eM38akhROmuBhLLdTuB5VJY9bmJd09+YpKQMbhUac+XWWgl4mTYA
	cub1ZA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sag86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:36:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f32050e72so1485932185a.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795685798; x=1796290598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=;
        b=SopBH1nE9sO7bBXQufnn3BAw5PcbewX8V+1taIN+/0We9K6Yv3/QQsiPmBIa0AbPhW
         O4Mf54um5v2av62hnLu332q9usw8GJLYYoB7FWZP8ZgRIdMTD/ZczDp3M+viIf5WYIcA
         4IjgLy5vRw12gd3R2xhKLCYMWOJFVU5AWGP4vuBhnpvYcoYhGiT62ez1OBwF/VHk17IV
         2LGO/URmcDLYdjZI0FM06b0bbZz7JWUAtEZcvGNkS4BzMi03VmZlcrE6u5Xt6RKPEVtD
         VkOBRbwzc6Qp768Mab8O1dkvvRDytgFYwwKkp5ropjJz6+oBunM4lpqIYlB8yWUPQioZ
         SXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685798; x=1796290598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=;
        b=pJG6D1fXhGD/2/1rqX4uVCWiRnmm/1p6RVS8a7x3XDpy9irAtXrJEbEDojHKhygiSl
         nWTsBy3O+a06mM/Yz3m9DfEU9EkkHrr68eoo5gCAKrz3TYSulpDJo8ZXmHSscSy70BSt
         T63ZqrWcsICYKfats0aOwwr6sQTNBHIQZzNma9R+JI+XTIVsrpZoszhh1buwv/66GRNk
         KdsuUMN/W8ejgZx3/UHU79oMpf0kgPGftbKFsEaW9AAXt5khGcLhm6lpZtpqwF4C3y5L
         cJbT7gcaeTCLClgVeks0TZRgw2aPUH/DQrR1bDBG48eZSU2jW7Rvzoeu5JSGNvsJoWW2
         z/1A==
X-Forwarded-Encrypted: i=1; AL+hErGsVShofMG5PWHgQ18I1R4M4LhVC8jb2KnDaKadsFgHsWMWbS4Pa9ZuCyZ9BDFfqQ2nUzVjpzXyi530+/0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/G85O/kTJgRLk5RbfHJ0DEIXglIa/l4nyKDZvO+hL2ewTgJ7KJ
	4EpH6fxWbQj0g0gV2YaXX+f08h2LhFYbAdOEWvNnwAA8g+DiuhXr62Npnu7+w1IQLeJ3oMuOAQY
	7E7mQ5ySB1xsIv9nl+LGFqBc4GgsgmbWTAMHm0US5ePInRTK6/dExzgID6lztsQRqKq8=
X-Gm-Gg: AZFdTZeUrLe5vArQPIEDrOpAX0b9nCQatd+fmE7MnBxLutNEDguDjGTij4fYOtAVp/C
	UOb6rxWGygm+jAYMfx8OiUJkfKTyTDd7ZOt2n7As/zXrYtwBbsjgoHyOYJFW93vg2RDM+a4LeA5
	5Pid2LUxLP1vLPNNeKNZ3vSqd/S0fMWGORu3Df+ZJX3+GqbwU9011g73tKIG22y3WBA0ybTspJF
	FvkewkngvUmI4T1EuxmAHjER4MvNNybZRzTCdTM4uHXL3aU1fTw3GorwoVkp7XWd+ELHnlGnF/8
	WqNp/VM+sIlTEEG51Qcf5S35+5uJ0HNo80K8dP51tRKri8I9hiLXp3J8uYCO8mi3bNGeP6oAlqX
	p6photumPG+q/uDBDJszCsRz3f1ZRAf5n7q9zt8GonR9cuUS77n1aWwiNHy/5UC6383D2waAy2c
	xL1w==
X-Received: by 2002:a05:620a:45a2:b0:949:721a:184e with SMTP id af79cd13be357-949ba9cd23bmr3593389385a.36.1795685798567;
        Thu, 26 Nov 2026 01:36:38 -0800 (PST)
X-Received: by 2002:a05:620a:45a2:b0:949:721a:184e with SMTP id af79cd13be357-949ba9cd23bmr3593386085a.36.1795685798129;
        Thu, 26 Nov 2026 01:36:38 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960068fsm227079335e9.4.2026.11.26.01.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:36:37 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 10:36:23 +0100
Subject: [PATCH v4 06/10] fwnode: define the count_references() fwnode
 operation
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
Message-Id: <20261126-fwnode-for-each-prop-v4-6-d4b370ecfd52@oss.qualcomm.com>
References: <20261126-fwnode-for-each-prop-v4-0-d4b370ecfd52@oss.qualcomm.com>
In-Reply-To: <20261126-fwnode-for-each-prop-v4-0-d4b370ecfd52@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
        Len Brown <lenb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1638;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=uLLErtVyyBCCkNg/MASZUF+mZGiOHH8LUrLC/RKjXs4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrB/2U49UIjunv1TUDqXQxjp7bPV2Mn8id84Kjb
 YrUZdyxJnSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawf9lAAKCRAFnS7L/zaE
 w3CpD/9JCHjjxCL5P+FTpe8F2GGiawr3+FVB3NPlSOloMozb1b7V8YXdCjdR1vtoY5la/byNl5H
 D3m4zYV7rlupbToFkuogWz1vb7oGxeyH5t1/4jjU+X+1YBfeLYnW79JPGe+hEVDrq/HMRuJ5mG/
 XeVugSGOznf5XYmyk1XQQJy6djgaGAUmFv0wzzMk5JQQIJVZg++75XfCNnmQb4Jiu1fT4IZNESC
 vsYOwOqolSWhaauDQR2OLx3TTF8ZgViTLFYQ83kQfUkzHpaWTqP1KB0lPl1HW2EodNCDImALT++
 Ie0rIgLExP+blKqJpbyrPmKV4q2EE9pGTrVvQc6wo2IFFLoegext0vrgevpz8WW032VHCkLLkFd
 8nRXwJ+L1uGpuFuNs7ubaE8fgkAvRs+YIzdS70rxIPj2GhVlMkO3kZsk9uCtx75e1+eVTdPBtzd
 0RNZw9i+WHWdI2YEKUWb40peNv3F7jBxJhNYn32e1TxxbNtIK6BJjLOzDVg4fn6R2gW2BKaVaTb
 J4xlE1FiAfsA4vPH/3qWXETHEJwF4sRZWVGYPQlz27ngasIq/NSgGrISDP/xy8d26Guhxf4Dlbi
 X1n/RvSFXGz+63lB8gxMdUIWBm0lCCTSlshoe+XRIYMaAnwtonNdEwgUOobhN5KpKDVUij8UgWF
 bJAT3U7BA/wMT2Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b07fda7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=pu8Hlg4PHyDR7New1bsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: i6Metju_a_jbQ6QcJOChhtwtLD39_oFG
X-Proofpoint-ORIG-GUID: i6Metju_a_jbQ6QcJOChhtwtLD39_oFG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX48sONCgRG6jt
 IVkZy6uQW41wAdPGUB8fpMwWWbxLr2b1w+Dx0zNCJbeNpkx+HWjut6Lxol90yH2Rqi7lWm76WYu
 jmis4AIA1aaTf/PVNyp1LI/SYmvZsAuQT1709BbYwDZt97UbzYCTHOFmrr5WzMDcK0fyvB538UX
 WhXJR+IUXrJhVhZd1DQNCKF+oAx3N7I5AdZfpVvJ7o/8xJc4taHa2vFoKwWkdEvLYbVN1Eb4k7n
 K+cQcjlPUCVe3yUR0wtAX5NRZrdnzZZIbJhQOlt1qCiFXko6cUFMXTuRDl0wDvfXnz9VvtDNZHl
 pgbWzOjIrUlhRrpYDF6I6kTS5g40ofA8nBKu5BCuWAMncUFes5JIsrtzA3tQMXWYlb97/+kQpYC
 z8d5C6xCZL6aYVy61UOYtpJ7bUT4meEWhG3dhGq89TJ9xL87loSu9u9/bo+/uJTDvkeQiL5MuEB
 pe2sa8sSxXJ694b2jLg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX2nBUhN6Stdp+
 xX7Rytjt6jaTYlqpQL/lAfv3EqMpzp/wY6zb8lwYMaXocxy0UxuGwSyMhUrDNmCt3FM1uttg6g6
 xFHwu1ORqbVSrEdwgzjQukDIbh2sSN0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260037

Add a new fwnode callback allowing to count all references of given
firmware node.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/fwnode.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
index 2d7e0b9245d445d473c7317bd27058abe5750b40..15acade60564ddb5f5a48f2235b626466d77dbdf 100644
--- a/include/linux/fwnode.h
+++ b/include/linux/fwnode.h
@@ -137,6 +137,10 @@ struct fwnode_reference_args {
  * @get_parent: Return the parent of an fwnode.
  * @get_next_child_node: Return the next child node in an iteration.
  * @get_named_child_node: Return a child node with a given name.
+ * @count_references: Return the number of references in a property, including
+ *		      empty ones. @nargs_prop names the property in the
+ *		      referenced node holding the number of arguments, if NULL
+ *		      the references have no arguments.
  * @get_reference_args: Return a reference pointed to by a property, with args
  * @graph_get_next_endpoint: Return an endpoint node in an iteration.
  * @graph_get_remote_endpoint: Return the remote endpoint node of a local
@@ -180,6 +184,8 @@ struct fwnode_operations {
 	struct fwnode_handle *
 	(*get_named_child_node)(const struct fwnode_handle *fwnode,
 				const char *name);
+	int (*count_references)(const struct fwnode_handle *fwnode,
+				const char *prop, const char *nargs_prop);
 	int (*get_reference_args)(const struct fwnode_handle *fwnode,
 				  const char *prop, const char *nargs_prop,
 				  unsigned int nargs, unsigned int index,

-- 
2.47.3

