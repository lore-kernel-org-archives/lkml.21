Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458533;
	b=ACesIod7bwpIl9X/ifxsrgUQz0lqLYQJfimpbUsrgGTEaDkIWvS6SvGC4jgVT2zJAxjD
	 Tv7Eb9WgpZN38zfbK7QPnXV3UitNmtDJ3BsXn8h4rWP+f4TIIWDufOowzLKKw74fxqyk3
	 QhJRG6YAvq6kTVC7GJ3XKteMuwcmLDrB6uA6yxKFvw03bicRHhN3y6w1enP1lRbFUUpIA
	 AbixW0RsdSKIynX4Hz4ZA0a53PMX9JvFHSuHXslRx6vsQAvh5plCoKTvl60p3MlDWn4Jk
	 TJaBI19+cuPqEhAWuNXqKq0Bhj9vMB9TUAIjqky5ahRIc0sy6uyIaFjXLUqCAe0Qtbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458533;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mjs3rlDnLUkN31VdHb88E8QJ4KDT+KUi0fn1sZoUpDA=;
	b=U3sA2XkYv9JxChybRtRrkwXj6+1SCKUKNHNiNsyZ6qouIxllOogyAqwISmD6zcj3Tz+l
	 ZppOTRCadk2Og8tDTVv6E9nc6N5hIhT/utj2yLpZen0cu3Jz0ytBE7mBraVfaZZuOx+HV
	 xNM+xLW+UfS/ewYptLhqmjMxqgYytiXwPFmlRxJsH8vIQleiHAs50QdqoQI+7rzAI5FyG
	 +QYsWt0B+ZqSYEhzAXCrblBkAcEnwVHooiLnTcX4H0HiwcOHY7VhtWLk6TMLfpPT9hVKC
	 DbFqZKqjXaVpalT94TLPkMuKffk4wh59wk6OEPeJhgrQ59xYAm3eihvRsJzc7k8ACAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jrs0eb9y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IQwjKs8d;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202CA606A682
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 202CA606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jrs0eb9y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IQwjKs8d
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH8602487483
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mjs3rlDnLUk
	N31VdHb88E8QJ4KDT+KUi0fn1sZoUpDA=; b=jrs0eb9yNOPRhUgP+oR3l6ZbbnA
	XB8+idsJKDEa7iqJD7cM08ya5idCY31w0TC4sx1eOIbdKn4zwDsYyXnUBF+CEh8P
	WsYPBDT53QOTRtlXkgUHBqp/xeF8WYGzYpTXRj50EDNij6ucnnlHWYpUhVz1Tf9H
	avtew+NWAJJT0GVd+SiXxQ7JiTQjDfIjPNYU/UQyfHdrqmfnrXc8L8wxpQkfLKDZ
	9lFKYSZOiiqvWUAycaZ2151OkR/vaywddhtMflhLR2MkV5wIjNbHaU2ru5bYPMmx
	YS3RsrvJAnZL1daxaLOJDoHyAfOlRFatZAH/zF97x78EiYb70uqp+CIkM7A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy02v30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:28:51 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375bac6bd21so4030883eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795458531; x=1796063331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mjs3rlDnLUkN31VdHb88E8QJ4KDT+KUi0fn1sZoUpDA=;
        b=IQwjKs8dahs3/GxFhjLsN5QmRRRvrFQsCKgmPenRMU63mw9FyN+TU1Pv6c7tQaX7+z
         LmgTADiVMXLIr5jIlH9xYRXrt7jmUI702c48w5Lb89LCTcixBeCDi0BZ+jalCJrFlRc9
         y0qBdqWaBZJmMQmz24Xw7kQUatkQrK0kvoEICJLgjM6CsUK6+d8ilCgKrQa7UWBYKXIA
         94m4W1YKfX+1WTZPr9/vuBXa/7QSoZ3/1jd6FiD92cOxnmjxzLUcOhvglWLD04Yjs02k
         AkKI3IQDDzM5B1YlbT5qJCRw5aKavS7O0eT8GLE4+jIpOzCXlGOjiJoaGUZf/8OTi8jA
         1ULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795458531; x=1796063331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mjs3rlDnLUkN31VdHb88E8QJ4KDT+KUi0fn1sZoUpDA=;
        b=ZF3N+zEXTKaNdkqosW37v7q/48tJoV/s8RQV/63N5osKoxzG/StxrjhunJWjVPRHqp
         SPmg4dLG5pcZB/gR4j58zJMWdir/L90wkTO9X4T1G6blfqd9llDmWRsP6raX8GB23lMu
         HVg32aesVqxJk8yIMsCMOFCIDJz6YlskZUOvV9gyB9k89adtrb+X/ICxcwf0aq5rxdTU
         3r1hOZd5gKOx3mPTR++kc2omb7cIWjtM9pj5TF66IG7lLJEnOabnYgkZ94/OyXxhjlQZ
         xg48TO5HKV5WnvEZP0CC6bGs7/0hrK7ww+vUgu17kQpHvJY9tBMNaj+5int7OyyA8pUN
         92Pg==
X-Forwarded-Encrypted: i=1; AL+hErErJD4UthkmKsqp8XMBCBNEZ41FT5hx7rLuRYAW7LRDtVnAzj1efK+DdiZd+2EJ1xFeZfCsHIKbmIyLdQI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FuNxnoOMBI5rZL9FgKpptfkDBKkv43KX3th4iitQltqzTLkBU
	Tus9MD2bvElIst4f/ii9+UivqdHxS0G/mroxOK4C/9IzkjSzNsUX32wtbhFUQmGENH1LxKftQ6q
	hAMpd78e4c5nHM2Lkyk5EWhkDFoN5hbhWswiSuLCLqrHE6YW2s7etoNkDvSa4CTHb1Ew=
X-Gm-Gg: AZFdTZd3cr59eMc9rphjQwix4sM61elqG0DKSibFojF2RpAI8uhh+syhDPVLF3LkDTf
	uCrg8ZX+BfHSL1a0VglMGF3FCNPhh0s1+NBaFfrvssgXFy/82t2ZPOUuVR+qKpzNt+HD962O5+o
	HTzDH+4bakVwE6h7PPZZXbgFKFdFhK1UcQKuUPyw2X57fBjN17OD6bY2ZgBvxImWNMGV8nw8V+x
	Vstllo/O3+KxTqtzT1lTr5u6cJ1KOM42n9YdEYKHWvDozxtTDub/StMkn+wGOPj8OOBYlKkCWW/
	Qidscvp1lfdYjY/8q6wNy8bW1EthFw+YCd9NXwO+ELkUJiR76pHcNrLtfQeGeK7LdGH3egMlBKN
	QL16h3AdzgR40KQmbOCsfN0KRpDHIZen5n588hDmjXlV975ugbuWdzwBdMePCWRIUEGmaYqgEYK
	qQhy154MNZ03en5uNnmz/c12PZtg==
X-Received: by 2002:a05:7301:d18b:b0:386:b4f1:dab0 with SMTP id 5a478bee46e88-386b4f1e04fmr3217101eec.1.1795458530756;
        Mon, 23 Nov 2026 10:28:50 -0800 (PST)
X-Received: by 2002:a05:7301:d18b:b0:386:b4f1:dab0 with SMTP id 5a478bee46e88-386b4f1e04fmr3217073eec.1.1795458530113;
        Mon, 23 Nov 2026 10:28:50 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm47697986eec.5.2026.11.23.10.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:28:49 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v10 1/7] dt-bindings: soc: qcom: eud: Add per-path child nodes for UTMI routing
Date: Mon, 23 Nov 2026 10:28:41 -0800
Message-Id: <20261123182847.143892-2-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
References: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfX8mPaznwWu1sT
 OsY8y+qlhR+4Q+qNe86/45q5Fz6VO8kogD42NCzuqnV7GRYfaUIrifgM712Ja2vcVAWwLI3FBmt
 Y7JOaX9V/obHV5wstW7sMERL1nZy9P98YOvdTr/4xLS672zHqZ6X3vvqLRLgD5Iu028iMdHc2Ow
 hGcMbjyNRnXoL+1FddUvAsmZceFRILTMH6SAiI26Kp+iXYBsjKoev4O6ecWdOrjwa8rMF2tviiz
 hzMWkNmnHqU1C9uTQEwsXTVEcqkArFowVsLOnZulVaEvvHXRtaEqqwbCUoYla0ovJUsZ5hnoKCJ
 W401mkJueyyHOSeDR835FkXazR9JLxyatGPd1LajEzQtPtQuZhx8Z/P5nESQXn4b9KBNiE4ssUD
 nXFZSSTwiD8qnYx2h0lS01ijFXNjaldbSe/j6V/HS2VTXm5bxjMGgtIghe3W0DIId9s+eI3AUKV
 TWSu1NwGKFB62Iptxtg==
X-Proofpoint-ORIG-GUID: ukQJFQYdC5dWd5wOYVo0bRd5A1ySWCra
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b0485e3 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=RJ9lep_nkaVUh_m6BXgA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: ukQJFQYdC5dWd5wOYVo0bRd5A1ySWCra
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfX09COe8F6UjX3
 bIlSedmzuX9mVfHhCkaSyN34JOzvfZtdm0HHHrgIcBVSzhETacw6zOhPFcsH1sV5ltc7gybqURI
 8X2wIwjt0fhkVFtjSjTucRM6lmY/0XY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230073

The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
High-Speed UTMI paths depending on the SoC. For example, SC7280 supports
EUD on the primary UTMI path only, while SM8350 supports EUD on both
primary and secondary UTMI paths.

Each UTMI path connects an independent USB controller/connector pair and
forms its own role-switch domain. EUD routes traffic based on USB role.
In device role the debug hub is inserted, while in host role it is
bypassed.

The existing binding models EUD using a flattened ports representation.
While sufficient for fixed device-role configurations, it cannot naturally
associate a controller, connector, and role switch with a specific
EUD-routable path. This is problematic for role-switch capable ports and
becomes more pronounced on SoCs with multiple paths. In such cases, each
path forms an independent role-switch domain and requires per-path role
awareness.

Model each UTMI path as a separate child node with its own OF graph. This
representation is used for role-aware EUD routing regardless of whether a
SoC exposes one or two UTMI paths. Add an SM8350 compatible for
dual-path EUD topologies. Retain support for the legacy flat ports
representation on SC7280 for backward compatibility.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 .../bindings/soc/qcom/qcom,eud.yaml           | 138 +++++++++++++++++-
 1 file changed, 137 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index 84218636c0d8..90dc104e4475 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -18,6 +18,7 @@ properties:
     items:
       - enum:
           - qcom,sc7280-eud
+          - qcom,sm8350-eud
       - const: qcom,eud
 
   reg:
@@ -45,10 +46,92 @@ properties:
         $ref: /schemas/graph.yaml#/properties/port
         description: This port is to be attached to the type C connector.
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  "^eud-path@[0-1]$":
+    type: object
+    description:
+      Represents one High-Speed UTMI path that EUD intercepts. Use eud-path nodes
+      to associate role-switching behavior with specific port connections, allowing
+      EUD to manage role transitions independently for each UTMI path.
+
+    properties:
+      reg:
+        maxItems: 1
+        description: Path number
+
+      usb-role-switch:
+        type: boolean
+        description:
+          Indicates that EUD relays USB role-switch events for this path and
+          performs role-dependent UTMI routing accordingly. In device role,
+          the EUD hub is inserted into this path to enable debug
+          functionality. In host role, the EUD hub is bypassed and UTMI
+          traffic flows directly between the PHY and the USB controller.
+
+      ports:
+        $ref: /schemas/graph.yaml#/properties/ports
+        description:
+          These ports are to be attached to the endpoint of the USB controller node
+          and USB connector node.
+
+        properties:
+          port@0:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: This port is to be attached to the USB controller.
+
+          port@1:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: This port is to be attached to the USB connector.
+
+    required:
+      - reg
+      - ports
+
+    additionalProperties: false
+
 required:
   - compatible
   - reg
-  - ports
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sc7280-eud
+    then:
+      oneOf:
+        - required:
+            - ports
+          properties:
+            eud-path@0: false
+            eud-path@1: false
+        - required:
+            - eud-path@0
+            - '#address-cells'
+            - '#size-cells'
+          properties:
+            ports: false
+            eud-path@1: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8350-eud
+    then:
+      required:
+        - eud-path@0
+        - eud-path@1
+        - '#address-cells'
+        - '#size-cells'
+      properties:
+        ports: false
 
 additionalProperties: false
 
@@ -77,3 +160,56 @@ examples:
             };
         };
     };
+  - |
+    eud@88e0000 {
+        compatible = "qcom,sm8350-eud", "qcom,eud";
+        reg = <0x88e0000 0x2000>,
+              <0x88e2000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        eud-path@0 {
+            reg = <0>;
+            usb-role-switch;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    eud_usb0: endpoint {
+                        remote-endpoint = <&usb_1_dwc3_hs>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    eud_con0: endpoint {
+                        remote-endpoint = <&pmic_glink_hs_in>;
+                    };
+                };
+            };
+        };
+
+        eud-path@1 {
+            reg = <1>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    eud_usb1: endpoint {
+                        remote-endpoint = <&usb_2_dwc3_hs>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    eud_con1: endpoint {
+                        remote-endpoint = <&conn_2_hs_in>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.34.1

