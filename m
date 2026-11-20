Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178831;
	b=vErdS4grgNMLaMXzPuKfA3pyhKJsEWpmwST0fdnf+T2tJNklnorhHmQPSZKwDSzsWdN9
	 //UhIUnVzlc65iPrDUl/Re0HtITWexJyr5Y6PeQQlDWVEVbfDFJypyvuAolr0uXFVeKUs
	 bZ8PHm/NXd58KRCjG3C6/y1yZNNkNsyLI+oSn2VLVXzwbGAQy4hTBpUYXtCr+eZ6dusdx
	 6s9GCFoeccqFOErgdjOAGBchxzh5cFmrIIZgDoXaT2Vp6uKD7BnDTTzSEz457cXG6ktyc
	 0v4MPzj1yqVM5VESqbncbXfIFMBlaa/ydvQNqvtDsUvCYY8Q9TuJkSAlbeZxzD+l0Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178831;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=;
	b=p3ymMCxtTOF38cdiFBZ9P4k5AbuxC7ghZQN45WUpFTOHMOHNEbF8Z3SvRE8eW8NZCY7s
	 hos11egr083iDB3rPGoaIEi2HsFmNuZE1lFtHs7zmag8E2PVSuJQotV5JRj2KsD2yr/hS
	 R9VOiKyJjOpGDG3DxvK4g4bSy6Jc3BNAsnX93NSRD7JPOi349amOyK5VYA0rrdghGgNDD
	 2JmzqieOQw+4XOUhD+FLjocAe4MoUsDkRPZ+2Ld8KdCgAiKA2MeE+xljTvKvnZNXhE0RS
	 +V3/uN6rtQvb/VRgozG+D5hGulf5Z/vq4cQdkXHQTyV1mnE6BEHD8CLPhBBXYL0zv6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kAGwoYqj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jO1qHF7P;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF4F606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CF4F606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kAGwoYqj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jO1qHF7P
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkg5a3107621
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:47:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=; b=kAGwoYqjsmEOPEvP
	RG+KpqsE5zTdml35zlezIrOW9bKHXwW2kZmk6LInh59yRJVcubAJlwRE6yz1eQp4
	tlIpsbo0fM3C7HjmfNcN1gBnKO3TCQy0Zdn3vKhEt4+cXYIbrcCxc6DwuwMoLVUc
	35bGjsWoQRFJrZB+tzVKEzXnTnraP6EJ2tllQ2IyYqwCYKLpvfk236uFKkFkjcnm
	gRjtbZCM/qHwJ86d8OXDIBHXk8l5Ww2xRQeE6mRLm4x1d0k+DYqbz+phvoRNdxEH
	QIHP66dFfcFigzkpoAy5Xcqap7Ybg5UqUEa7ZXXl8pZg9NjSzhXZFzRV4HUitGzv
	6J335g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au3rc1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:47:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f32050e72so237690885a.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795178828; x=1795783628; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=;
        b=jO1qHF7P7o4akl0RUuE/spzdPombuX15HfrCKCXmhjHdxo6PHCl0R2iYKQ29vCfHis
         Ry7fhXkc1LhwoxhTjXYKvXBpgXQNFKeESEw9q1tWi3W4Z9beUbjpd3md3S+P8i7quMNy
         8jtjYt2kzrCEMR38rxCZF3wUNxUo8YLtb/y5QrflZFAzgS6QIIKkC8ULTjlOAy/vAAHM
         NJDi6UGRSd/5C+TX2VXRycFoU0jQ1iwTtoCrFN5DlSNHZJaFsPc3aSpwZoJ03gNgCHHB
         uTd04ayi4x8sTzEuigLJqjD7majhDCOekkSuwjK8a/egOGUj9uafhBr5oqoRjAzDmX8a
         K+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178828; x=1795783628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=;
        b=iBbP5xziGLfPQ3J6ddBcBswz5LGWfKFTcJdgQy1q54jbF7Nnx01K4PWfRxAq56K8ws
         mDY74bxlwbECd1LGxl6O7q8dmNX8JdWbuMIGa+3lNT1JsIOrHG2w5e/kaPfUYrsKpxIw
         UZAlTKkwCjaIKjqXnYodeMIVrDb+nP/50xVEUeMkwzwxncm0ghKitgv9GKpUnGf3ErdL
         z/x5PNyVDM+aQpsMrKYAGtJR6XZhkBx7L4lDXTKVwr+A6KaLewVifHB8aS5rYVXLbsKG
         dj2CDOK2B+R5/ILM/PGQIJGDFL3lG16FVGv7a0fuQdHd33UAZk5FidQP0SAyxxTJqK17
         Ewqw==
X-Forwarded-Encrypted: i=1; AL+hErHWjknXfHPFhhnjkY/9dUOYbbXTxUhVNRGccbnGuLMOfUTXTzQZgEClN/HC5bff0chSpTpV2PaGmF43yyI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IIkslKAB+5mIofnRkRQc9jSKbMi2mJjExZRBc9hSLnhZJhE1O
	gRb6H/zWRBR1zxPtAq+vId/r4zuYRKPqG8esY33oYS/fqxY8r80FssG1GTRrKt73JkhGU6u53Dn
	+rCaBiU+GPUj4bp5/eajPogGQNrcTo9ABJdnF940rEi6Q1sNW4eAVEqSryhd5yQHdBso=
X-Gm-Gg: AYBFou3qrLsri9qHLyGijMK85Pwb6uVwe0eNXVWJRsPt4YcckPWrQ8sDMb7ysaLIRdT
	j36r4iiHYzlhyygmp2Ev32E6ZaTbFVLGywXz5ivK05gIn2FswQpGoibTgFtYsj0AdTBe2bi7PtA
	PTOjlgRuf242M0wqzhciXvTTNuYMoSgCJZK8dLJ7MoRlRPyVjy3JSLGTXMz71RgZpTz8zoTJQ/J
	dMF2aDM4rfwxVYaUxBAmIonQ8JqrjfrZOSlhsuTSD4FQkBJFUvnxXOVdW7LWOvw8sl/28E90A9S
	rEtfZgDeW6Fmd3l77qvL+6NDRFOBcJ5FtpltDhzVCffojQarebalIFbfkmJIg/uCLmtqGbOT0Cj
	yIhx2yY4vTPUPICKnU1PcHU45Gbj5Gp7fPoQGleI2ORUckD1VpjYUCHZM4SZuIqP4dq92R6Fu0b
	k=
X-Received: by 2002:a05:620a:4453:b0:93e:c12c:fbba with SMTP id af79cd13be357-949bab47df4mr465800085a.71.1795178828451;
        Fri, 20 Nov 2026 04:47:08 -0800 (PST)
X-Received: by 2002:a05:620a:4453:b0:93e:c12c:fbba with SMTP id af79cd13be357-949bab47df4mr465795585a.71.1795178827983;
        Fri, 20 Nov 2026 04:47:07 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm119248995e9.11.2026.11.20.04.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:47:03 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 13:46:43 +0100
Subject: [PATCH v3 06/10] fwnode: define the count_references() fwnode
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
Message-Id: <20261120-fwnode-for-each-prop-v3-6-808e304dc73e@oss.qualcomm.com>
References: <20261120-fwnode-for-each-prop-v3-0-808e304dc73e@oss.qualcomm.com>
In-Reply-To: <20261120-fwnode-for-each-prop-v3-0-808e304dc73e@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAEE3uresk7TAtJ8rliLvhk3SedImd2uTEfvXz
 2xdszcr3XeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawBBNwAKCRAFnS7L/zaE
 w6LmEACYmRIPS0gPFt2gflTXMQeY2t8+0rQqwmjThzMGX0djCywgpXZ3HDOGp7XitV+81T0yfY8
 iKtdUOG5Zvi5dJSBWI6R3VZIyFj/1NGOMWOCuti5JkgVqm2Tve3KQDazZJwgjZfvaPndgpbw5KP
 CxYXQ3YftxvsbooRE9DQkRSkZ056NIaRtJWUH2a2w4QVnS/Kmfk0ZD3/SmwAgaHkm79Ma3jpAWP
 Mu0Ke9tCPBAaochJ+RAJoMC9jRWd5Jkbzpa/wW2xDiTn8bK8IleJivLvnxnLFQi6jSencLgOGPp
 m7P+g02A/eeTZUsnHXUnVE5ZmOYo15yzDN60ErDsZu/98O+Ch8PeVd54PVyD3rqpbqWjiAyPAa7
 kGlp9G57fMEZv57qUFcZPAx85AYSNx0W/FmaXn/vbfvMsmIAgy9ve2HFXeywf83gr59lsdzfxu8
 ODfZeZ6XXhefRH7nQZFgHxsE5T3yEFnpqGJVJ9N2z8sIw5PQ/x1lJsIz7F8GillN3O0eqPPUroe
 fnB7/Jec2MbvozCzZXSYBdhnVzwWhxUZbsTVch1xl1gdhj6BjiECQCvPol4hby0jzwZubuJQ7E3
 21kBn2CKKGgGfGsMti+vvqoAJ/0QFEd/SnRz+B5Cyvo8Bp6LC4+35IOtDzTHSCVaJohD9Zji5bl
 8quoz9OFXG2XsSw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX0dORNUVfrWY/
 ZAoVs90lcFhib+3eVUg2PZa2lE4ATwuO99SzgyYaTSRtBd3yHlSCvLiPA4oXXH8jkfZJuNJP++6
 dFGxc3eehZCU2L8Wl7Rf+r+6NlTSXpCKdLDz0EnvYMMJpeiv7WiUWJLACIX2X0irX9b5RWx1s0t
 UcSU+39kpYG02sxz9egSZu39R3hDpn5FDsKhLqqfM1nC1Wf7qjxmKZh2UrbNDzU8XvJF4fG7kvW
 lgGgr6Nx70E4B+yeqViGwAZcksXNNeKVTjimXRCAgYitp4EEp4NMUQPPK6bNESTYlJ4BKFtIouV
 ueUhxKfKvUrnT0Dfkelmumumtm9kykBfKIvzkjbhpOXujREq4bz6Z+6z2cjPQWGqC9K7Yb0wJWZ
 KOzCwbtgNwexhVdg0lvEwmJToNskuigQSknOgruPTTJrPdWmeD5pfoIickILlejpVwaBAGcfMNg
 XATW0oWB8b+diZsAasQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX54QMjw3X56Ip
 vkDLbfAaHNLb2efAmuXe7uwJXDtnLRpTVrlD9UhWBDOTwi7XA+SiE/JZYYffRW7AG6kHC+HV44A
 lngH4RKkVJlggWC26ix+S2j1DHuHU2U=
X-Proofpoint-ORIG-GUID: nhze94KlCytHBGUiGRcUa_nToxXdb0Kk
X-Proofpoint-GUID: nhze94KlCytHBGUiGRcUa_nToxXdb0Kk
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6b00414d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=pu8Hlg4PHyDR7New1bsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200050

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

