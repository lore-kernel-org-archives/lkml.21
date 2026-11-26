Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685798;
	b=ylxssnXUhVwu+ew94uf1RKQHFCtu4cBAWjACDfJrYcofqFdF3iIoL21JNEenr0OVroZ1
	 BQxVbGIY6T34WgmAED67M7XT2LC5JBN9pkP3fI6ehX8yrpfHdih2ozH9wktf4ATLVh9n0
	 9DdofVo3VTRjfmtn5EFmEPOTewqrZDQveb+OPc/giGTXpC8hwdaaigDL+20dlYeih50uH
	 lLfqpMl9KedN+LsW01O3Zp6xmEBVRMdBSs1mi8SBRpYSvWTnJLzUc8uRzFkK7nqOQAQai
	 kVXfx+wYnYnLPhYBZccnOhugz+17vNbABh7S3Wn4h7c66qlvfpMmHuNGtDXyzwySaKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685798;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=i7bRlwihZjUTsFP6PHnkL4XdT3UqstV3KfzOVciL9bE=;
	b=5jMz2c5gstGLAXQURdy8UXcV/o7uy7DRrH83CMqFzGpi4r+RBzXdwHN8yHhHpv9EeFBr
	 J44fqdtMyxHxm5mdUryYZYqA1k0pqzdjiiCE/jm9/YXWpPxSXq2Hnx2PS6IZtu2tLVmQT
	 ChOZWoaUK+P5JeOEk5oxXa63KTiOwkPvtjhXs/LoLAtAc36DIfmMNVU74o3RhB9VczJYo
	 XXO0yBOfsvWVQ0H+9/qaaf769lx3VQps9YAtCQenEcY2Conze6SxXI4stMLG0W63MiEbj
	 w9ubq0OxyMWdb41KY2IVjQPyPZjhzwR07ItgqFzP1YhQgxlB/BYImFfK3VrEtP1UgBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dfu8O+Tm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WSc7dLJ6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112C5606A69D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 112C5606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dfu8O+Tm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WSc7dLJ6
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7AvXf2594845
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:36:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i7bRlwihZjUTsFP6PHnkL4XdT3UqstV3KfzOVciL9bE=; b=dfu8O+Tm9GHq5196
	a7d0SkHOprz6sE7d/GI/NOMA+Mjpu1FFCuLSd0/yzVEdky8u7rSCRdbAn6PGz4PL
	9GrtpdDeRXIwnS2nxYBeLbZv0ZkenvXeERvLcLKowPBGc0TqHqEPKcXNL+gsqBFU
	aXJz6jKNQU+uU6R+78FNEJtVW02vYQrLDuYKIKF1WRiOarMF3ymXek8hpDlu2TBH
	QycuUhiRaq4/j05W5jm8alOA2l/dw/wlffaRZpoYYpJ2yoNMusIMq0nc6HOunPMM
	BLoAJ2c2Tvj65xeyJE/XmURoOT2E7miqS34bQBtS4pLFk4TL33WPTntXOhM7eq8j
	dWm4LQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sag7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:36:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495af07676so1037672785a.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795685796; x=1796290596; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i7bRlwihZjUTsFP6PHnkL4XdT3UqstV3KfzOVciL9bE=;
        b=WSc7dLJ6CL6SBQC5M+kj6n4bnKILnReyAINStvGuF3N7LsLN/LDtLiYMqCT1ACgAzr
         ATt3zfZw/a+lBjRfqYriHhXVHir00H4lWKcV3jsHIU1H5vo1cE2DLnz7lwmWG7tGk4/B
         NsDf7IBv7harZWpKvUpyDryo6sQpv81AnR7P6n4MhNvIOYatk9AyY7xNauAC5iR6B4hp
         L/btGNkkj5ygSG7kgo3SG5VV0rpU7c0cIWZX3ztOvh96BCBKWfXYy3bqjgjEQIBrvghr
         DhXSk3XwR6z7FHlhtieYYmDxkYsFz16T4ID6TaHVBtuWvwekqwwZ1UPLJo28pjmNQRcE
         au7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685796; x=1796290596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i7bRlwihZjUTsFP6PHnkL4XdT3UqstV3KfzOVciL9bE=;
        b=nXBK1L/FxdPjRKwLUpGtMvDZzDFQyPbz2l/CU5Wo4+J0baTDF/0svIfMQ2YuXU0ovX
         OiVUFiO5PtK2Vd/kiInp+mPHjybyWKTsRtR41c5g01xvODmZ8PXVFBqevdWwV7s1pOYM
         opHGcZhxwO6AojXp8B5hB8M2sL/rzvMv4wlbk/OCWt/o8qq4bcHC7qsVRIaOmRTSFNe3
         yytKhLSzuRP38LaRGi6IvjyZPYUTS6A8EiEzq7N599kuBIKkzyWmpYWuH7EtJ7kCH7h5
         ZmkLcqr2rH0kgdS4gxsix+htWyOeU/ZMMr4DeVmYt89Eh9eXuU22yNLi7BfoyMRkK/LC
         tyWA==
X-Forwarded-Encrypted: i=1; AL+hErGkId2hQcoeiZo7x+kZaKVkqB1UHhB4tLz6wGagk8OMqzVTVxkhGM+qbQyrmCNRoLOXTNgmUaBjFa/hde8=@vger.kernel.org
X-Gm-Message-State: APuU4Z84TPcT1FLGa05JmsVhWJo5Ezdto5IGsS+9Kk+/6Uo9kMEtBPA2
	rh5bjyLNUrKYF2hSV2VfMXr+nAdV3i16MRAJFXK3VvncBxXxOlmC6xsS7rhfiekg4AajAOIOZk6
	9p97XEnjxvsKDGQn8IhHN51gcV14fVrzVaREjxIwjG9ae9VTwcjGMsNFCXO9JO8XFlaY=
X-Gm-Gg: AZFdTZcGW9nURlgK35jtSYdBO4VNibDAtnkfPqzun5InAq/XzqWxfAH/Vn5bidbBlCm
	qI1GMLpftHTybaAYj6uR2oDVABx23WdplIT3+I9ls/kUlaCys0daXbBRj5JG+b1hVzLt3LVZct/
	huiKKt0Y2iIrnuLbKEz9Nlp3P1eFOd1bgJRhCj/K11IwJzdY/z+VbXuSJbF7JdjKGuzui5h9WHg
	018aeAMsUkddX+vcKPa+y34rSUAiXcOKBD5zDwWLvqHgIcEdwgSsbg081d5Dn9IfeOgjmBsW4AD
	1yKvM5a/XFm7FINPtR0aktlSJuD0DqBJEuiJiBbmd84nt11tQGCDqikukxzS3N4LJcoSM9+tY5M
	dWbxaJ9w4iMfs4neE1WrJDVp80bhgg0lR8isQjFd9QyCX8A+5y3TZ6Q2JGvi4KznKzfx0mz1EKt
	TFsA==
X-Received: by 2002:a05:620a:3915:b0:93f:21de:f3da with SMTP id af79cd13be357-949ba9555f3mr3146877285a.15.1795685796451;
        Thu, 26 Nov 2026 01:36:36 -0800 (PST)
X-Received: by 2002:a05:620a:3915:b0:93f:21de:f3da with SMTP id af79cd13be357-949ba9555f3mr3146874885a.15.1795685796052;
        Thu, 26 Nov 2026 01:36:36 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960068fsm227079335e9.4.2026.11.26.01.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:36:34 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 10:36:22 +0100
Subject: [PATCH v4 05/10] of: property: implement the .property_get_names()
 fwnode operation
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
Message-Id: <20261126-fwnode-for-each-prop-v4-5-d4b370ecfd52@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2169;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=cY8stbRkz7FS1iwfnygR3+k+2ltIZm0psXD3WUEmssc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrB/2UO+lx01O0GqAWYuDsvg08MbU6QceNLg616
 XID7nnBbP6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawf9lAAKCRAFnS7L/zaE
 wwatD/4kfdutYcUeg+BVG2axYBYlEgdVMCv+0Uzrpq7Cg9Bc0hKbZA37FbMw0YJqYYimMg2ckOV
 p05Lqi1rUbTLdIo4JyC0n+dEs492aPwD2rw9Md4ALEnQKrVClsjOI9kdum3pLyPn64vjEqt1uFp
 Ad+DXrD07tmyIqbMghSBB9eJT5F8YbV1SJDAhRKw0c3CBXaEOssFS7qg2Zzp0fNlPKwkV2qUCy5
 vmbMTkviVRBXN1G0YnPbOoQySAG/zPyp6uvSSzHLjDhA1MYszJJk1f5zmEjZs2dAowNUcUvN2Av
 NMPhbSg7XL5ajA4u56iFkGqwGpj8lG5Qi/zgslfWEmyFm5lQZJ9NjDlzmbnM+VZ7rpv8OYFVF8R
 dYXzUgR0yt63MMTM8uy9MXVYP317jrj49Oos9Z9BhJcK5Dxs3mc35TQyRU8t4ZyXs5wWN2Rsyg9
 w7/NjQlrtCMxoxeISs/w5QqWvRchfNyRf5HYSajuBtnsiMbpvJhCSGq0IM5EaSHV5ejs/PPnCbW
 XjL+Ic85RfxT+QG9qSR/xpjuI6zdkOT4DuSEjPzg71FuQ6/xf7rQx9OG88rJ+75Xdpnl8FERYns
 keFShgzyXMLu85XBHAiRHxsfeME90btahJg7Z4nStFp3vAl/vhrtvnDe70jzN385wLFsKX80sKt
 lOuwEaSEJ5E44og==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b07fda5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=1UpOkSE8KFTI9Xdxe0QA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: whfbGdY3x1AGg6qWiJVOr2x1RBHjEHhR
X-Proofpoint-ORIG-GUID: whfbGdY3x1AGg6qWiJVOr2x1RBHjEHhR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX1WUNsdfKSLxW
 qRkF+LvAGwg6urpogDi6IK0+8y+MzhpYBeNQf81n2Mf376JI6GrAo0kS2gBEy+m3Ws0I0IMrK2h
 7lg1+ECnNPNKlv8Iky+sRxkrtIK29EUPg5XT3oiGgSldLJVjA+2r6D5RvWU/Cjhgpojn2JBXKH/
 zIZO6I1whifD+EsCDdxRYBHBTiTDBp8mMGLNkMcuEQ0NYQ6diX1ylnA1E7Gu4jVkpibSTngvH9Z
 InWPgTknHQJIT9XDvw4zeBf90LRvSaDade5y41osgdn/CYwk/CigCDoieh2QnimG8NRpOuPS+t9
 j2s2q5/v9siYzCD2IrVkkJTN4z2jGKIIGzuFMdk8Z71nOBkEXmwTmlVGOT1zTT9R0YJVJtrFQY7
 BcCwEZDq7+JWYRQi8bhJZWhKrphxcHjdz0kmb27RGPLgN0PytTEOq/ZNiPojFvfT7O7cPToTYBz
 ngeyfQI62FKEcvteuXQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX/wA4b+3NcRtB
 8Cdw4FHrp/Z2iofzJ1dXOLvquonYseKC0ln4A+D71AOjGrrWV171Y2FZ0KFhbYSJeLpLFHFYin1
 0IU5bcxnpJbUkOCzHRu4T9rXE/o5gcw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260037

Implement the property_get_names() callback from the fwnode interface
for OF nodes.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/of/property.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 51db25cbcd4e8bb8c7066ce6223dee8a85e027f6..00349e78fa51455696d0b34ee02ae55c20cb23d6 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -27,7 +27,7 @@
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
 #include <linux/of_irq.h>
-#include <linux/string.h>
+#include <linux/string_helpers.h>
 #include <linux/moduleparam.h>
 
 #include "of_private.h"
@@ -1120,6 +1120,37 @@ of_fwnode_property_read_string_array(const struct fwnode_handle *fwnode,
 		of_property_count_strings(node, propname);
 }
 
+static int of_fwnode_property_get_names(const struct fwnode_handle *fwnode,
+					char ***props)
+{
+	const struct device_node *node = to_of_node(fwnode);
+	struct property *prop;
+	int count = 0, i = 0;
+	char **names;
+
+	for_each_property_of_node(node, prop)
+		count++;
+
+	if (count == 0)
+		return 0;
+
+	names = kcalloc(count, sizeof(*names), GFP_KERNEL);
+	if (!names)
+		return -ENOMEM;
+
+	for_each_property_of_node(node, prop) {
+		names[i] = kstrdup(prop->name, GFP_KERNEL);
+		if (!names[i]) {
+			kfree_strarray(names, i);
+			return -ENOMEM;
+		}
+		i++;
+	}
+
+	*props = names;
+	return count;
+}
+
 static const char *of_fwnode_get_name(const struct fwnode_handle *fwnode)
 {
 	return kbasename(to_of_node(fwnode)->full_name);
@@ -1737,6 +1768,7 @@ const struct fwnode_operations of_fwnode_ops = {
 	.property_read_bool = of_fwnode_property_read_bool,
 	.property_read_int_array = of_fwnode_property_read_int_array,
 	.property_read_string_array = of_fwnode_property_read_string_array,
+	.property_get_names = of_fwnode_property_get_names,
 	.get_name = of_fwnode_get_name,
 	.get_name_prefix = of_fwnode_get_name_prefix,
 	.get_parent = of_fwnode_get_parent,

-- 
2.47.3

