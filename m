Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108901;
	b=Zp++oMJaP6KMeV0asibfjWN9iskaItlmzd/GyrbiWjLKmjcC0FvpKo+cqSNoF6s0YPe6
	 4ZCcOeUx6bDV9xAi22fiaV/sEtIE9hqGJAQIxnOeFIK5s8GAhYIT0HjcOEKKiwufc95SQ
	 7EM5I7MHOoThZnYnhD9eLalsvUwwor0/hnUm5qn0JRVhkPyFFsc2bhbDIEV1TFbjFlAGj
	 B9VygrEIKU/Mjwmog3NZdbDRP8sdx/MR0WgahZQgKZxohf3xWob1Oy+VOq3c0Bri/osr9
	 YLwoE3qkeNEyvAfuuGbmp2I8hVT+F6e5y9Irps46AdFVD2T25CpiwQ9SrY8wfvFwjpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MZQKbJ2g0yFvI6L7amYGlUpDcsx4Luz+GqUAbZE0UNg=;
	b=vrUj/86lRaPru0RKOxMoaqxQWrmRNXOSXGaWOejrk9Nd+f5xUVkfGy30TIUc1RU1H9rh
	 kVC9Cl3d2PdMT78B4/xc1IphLnATuzUZI2su5/M16hgW/Wvp28PREnv/XxXLn8aRcrCIK
	 d3jcC1WDI1dSxWQoOMA8zPIm9aEkgTppkYwFuGC1eWTrfy+VULZkfY8Ky4pg+nXfVmtIz
	 zYXt7p/aTYGgP03GKLYeFIvVuNGQm+YYyKIFPZr/YX+MylwVNocaZrDH6kjikMM26BTEx
	 BGTwZBo/KDpbYzz2R1kITJPRuXM+6SlS9Nb3FOIgNbnw7X0mERmHhCRH0uBKL2UeMvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ktueSXbA;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC7B606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AC7B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ktueSXbA
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-380b40312e2so6852494eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795108900; x=1795713700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZQKbJ2g0yFvI6L7amYGlUpDcsx4Luz+GqUAbZE0UNg=;
        b=ktueSXbA/ZK8w1FOrycdueYk9CnEr4f8UDjqiKQUYHPD/t3QQL/I3+RH4/oN6rSZSx
         8IcBjOwWfutR9gziS7oUOTJHZv//J5lPFAZsSOoIVhKMC7TnsF6Vcfs4/O4dwNwk5/Kt
         2a9JqGyWcOWChOwEzliUhzG+6MqcKUVMSri/WzuNw2sG1WIH8A1S5gqxD4ersL8nKV3G
         qmTZbMGPpY/zA4GkBnjC/yKRHERDmJ9Oxwr5bSXlDmIvy8bSWwGx0T/9+GAEHdp31MiB
         aC24Y8mEwDCcBEvftng+ynsnWjLV1JbpnWe80DPgo3YetsjwItD+X8qkcfIyLIxQ6Jkn
         r6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108900; x=1795713700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MZQKbJ2g0yFvI6L7amYGlUpDcsx4Luz+GqUAbZE0UNg=;
        b=yH5VzTncJkG1H/XnPQqKw46eQiKYmPJ+N0igLSqcV3vF00RTULmEzrfXo0+ChRnZuh
         mWcYgL8AkmU02o78c+RWt7/PS3gJgwmEfUTqYqXqBNewwyg/DvCWZOTNGUPXMzLVN+7f
         BvilFBCroHNy6NPLGtqHznz7ClAd4Jj2Qg3MizJIh6q+PtMNtLStLfWIYQ0JXVRDAgEe
         XmX9s0BFM3HQQSqiG/li7nJwFVxJRedudXGSnmgOX3eNMhIf8R6QuG1i9XQ8P+OXDX43
         xt4xw3rEt13m7QQa8HOoNid2xI7iGN3ehhlrV0D41DZ8qUDcIRcPscwvmIjvdtpXpH6L
         G5OQ==
X-Forwarded-Encrypted: i=1; AL+hErGDGwOVzz4rNktUYlpgJyGSLUD9xS9vF2fysSzfQ7ZjUKVN6Jv3hnAl6bmIHl3OQrOAdtTQ2nVNsNxjwwA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WQ+yRg6+YFLxSCf6XksponRDoGGSQG8fJ/Na7u9xMTb6XHYOj
	TfmAIlFjUaKB4oTmU9Zexy3DPbOXCi1RO1UowgrRJY9iX8sMATCRRF+D
X-Gm-Gg: AZFdTZdVEumIu+uJxMhbjIq2+ujfpITMbZxs9vSLHb2ZR0Ir2fLlPK+tVcE+ssm1tv/
	DealB1tUN+Ad56GNoOI6u7X8Mz3C6o/ovbolVeUAymfIIaK51y47ihZ2VMc4MNkTe2xRfqBDWBm
	vQ6mDp92TGImipkkWvACvlD5ipuLfkQeOBVzVPstNEpCOlri6NHqfVaVAKf/wFmAqkjt1Ob6Mb6
	cjr4PszHy3lu3ZuheaZFmGrxcYofo96Sgpt7asdtPnYS4HsM8nmZwQoXs4gP/J/lbMW4OMlOFpn
	C+9e8egZNOUFjvWPF1yG/EEML5VCwvsxmxI6Cmf/TKTZyDO3dyNVJAWU4G3K7yA9xImDtX48svD
	aDokd1z98rwPSZ2nO6V3TpjiKlzdGjDcSEiYmgGlCd6RYjxnNyjJbxWxx57jxw9bqasv9OsEWt5
	mydJ7dk8r2SHN458BGCFeHMGijFXy1Au0x0Tm2RttsLknnX2HgHUuZoRzrT+jfxmXdDBSuIlbuV
	SS6qnMFb9eXvj7KKKX5WL+38Ywl6VvB/Z1/YPwHqjXG4EjPyQjSuwb7dFsd/eew65Xs5sYfP0GZ
	xgcr0NhOjPN6lEMzSKDoF1ne
X-Received: by 2002:a05:693c:4152:10b0:37f:4fda:1a85 with SMTP id 5a478bee46e88-3857025f271mr23165eec.16.1795108900173;
        Thu, 19 Nov 2026 09:21:40 -0800 (PST)
Received: from houminxi ([61.170.225.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672cf745sm226887eec.18.2026.11.19.09.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:21:39 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org,
	dev@openvswitch.org
Cc: Aaron Conole <aconole@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	Eric Dumazet <edumazet@kernel.org>,
	Ilya Maximets <i.maximets@ovn.org>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-kernel@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net-next v9 2/3] netlink: specs: add ovs datapath and vport set operations
Date: Thu, 19 Nov 2026 12:21:17 -0500
Message-ID: <20261119172118.3416958-3-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119172118.3416958-1-houminxi@gmail.com>
References: <20261119172118.3416958-1-houminxi@gmail.com>
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

Both families register a SET command that the spec never described, so a
YNL client could not change an existing datapath or vport. The datapath
NEW command also gains the masks cache size, the per-cpu upcall pids and
the ifindex, which its handler reads. new, del and set take
CAP_NET_ADMIN, which is GENL_UNS_ADMIN_PERM in the kernel.

The datapath SET command changes the user features, the masks cache size
and the per-cpu upcall pids. A request that leaves out user-features is
read as zero, which clears the features set earlier. per-cpu-pids takes
effect only when the same request sets OVS_DP_F_DISPATCH_UPCALL_PER_CPU
in user-features; without that bit the pids are dropped and the request
still succeeds.

The vport SET command changes the upcall pid. It finds the vport by name,
or by port number when the request carries no name. An ifindex or options
are rejected with -EOPNOTSUPP, and a type that differs from the vport's
type with -EINVAL; nothing is compared but the type. The vport NEW
request list gains the port number, which its handler reads.

The ifindex attribute is signed in both policies, which read it with
nla_get_s32_default() and reject anything below zero, so declare it as
s32 to match them rather than leaving it u32. The field in the generated
reply struct becomes __s32 with it. The reply itself does not change:
ovs_vport_cmd_fill_info() still puts the value as u32, and the two types
have the same width.

The commands in both families skip strict and dump validation in the
kernel, so the spec says so for get, new, del and set.

Both SET commands also send the updated object to the family's multicast
group, and to the requester when the request sets NLM_F_ECHO, which the
new op docs say.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
 Documentation/netlink/specs/ovs_datapath.yaml | 37 ++++++++++++++++++-
 Documentation/netlink/specs/ovs_vport.yaml    | 31 +++++++++++++++-
 2 files changed, 65 insertions(+), 3 deletions(-)

diff --git a/Documentation/netlink/specs/ovs_datapath.yaml b/Documentation/netlink/specs/ovs_datapath.yaml
index f7b3671991e6..6232760224dc 100644
--- a/Documentation/netlink/specs/ovs_datapath.yaml
+++ b/Documentation/netlink/specs/ovs_datapath.yaml
@@ -108,7 +108,9 @@ attribute-sets:
         sub-type: u32
       -
         name: ifindex
-        type: u32
+        type: s32
+        checks:
+          min: 0
 
 operations:
   fixed-header: ovs-header
@@ -119,6 +121,7 @@ operations:
       doc: Get / dump OVS data path configuration and state
       value: 3
       attribute-set: datapath
+      dont-validate: [strict, dump]
       do: &dp-get-op
         request:
           attributes:
@@ -135,24 +138,54 @@ operations:
       dump: *dp-get-op
     -
       name: new
-      doc: Create new OVS data path
+      doc: |
+        Create new OVS data path. per-cpu-pids takes effect only when the
+        same request sets OVS_DP_F_DISPATCH_UPCALL_PER_CPU in user-features.
       value: 1
       attribute-set: datapath
+      dont-validate: [strict, dump]
+      flags: [uns-admin-perm]
       do:
         request:
           attributes:
             - name
             - upcall-pid
             - user-features
+            - masks-cache-size
+            - per-cpu-pids
+            - ifindex
     -
       name: del
       doc: Delete existing OVS data path
       value: 2
       attribute-set: datapath
+      dont-validate: [strict, dump]
+      flags: [uns-admin-perm]
+      do:
+        request:
+          attributes:
+            - name
+    -
+      name: set
+      doc: |
+        Modify an existing OVS data path. The kernel treats a missing
+        user-features attribute as zero and clears the previously set
+        features. per-cpu-pids takes effect only when the same request
+        sets OVS_DP_F_DISPATCH_UPCALL_PER_CPU in user-features. A
+        successful set also sends the updated data path to the
+        family's multicast group, and to the requester when the
+        request sets NLM_F_ECHO.
+      value: 4
+      attribute-set: datapath
+      dont-validate: [strict, dump]
+      flags: [uns-admin-perm]
       do:
         request:
           attributes:
             - name
+            - user-features
+            - masks-cache-size
+            - per-cpu-pids
 
 mcast-groups:
   list:
diff --git a/Documentation/netlink/specs/ovs_vport.yaml b/Documentation/netlink/specs/ovs_vport.yaml
index fa975f8821b6..af7ee56f5f90 100644
--- a/Documentation/netlink/specs/ovs_vport.yaml
+++ b/Documentation/netlink/specs/ovs_vport.yaml
@@ -111,7 +111,9 @@ attribute-sets:
         type: unused
       -
         name: ifindex
-        type: u32
+        type: s32
+        checks:
+          min: 0
       -
         name: netnsid
         type: u32
@@ -128,18 +130,23 @@ operations:
       name: new
       doc: Create a new OVS vport
       attribute-set: vport
+      dont-validate: [strict, dump]
+      flags: [uns-admin-perm]
       do:
         request:
           attributes:
             - name
             - type
             - upcall-pid
+            - port-no
             - ifindex
             - options
     -
       name: del
       doc: Delete existing OVS vport from a data path
       attribute-set: vport
+      dont-validate: [strict, dump]
+      flags: [uns-admin-perm]
       do:
         request:
           attributes:
@@ -150,6 +157,7 @@ operations:
       name: get
       doc: Get / dump OVS vport configuration and state
       attribute-set: vport
+      dont-validate: [strict, dump]
       do: &vport-get-op
         request:
           attributes:
@@ -165,6 +173,27 @@ operations:
             - netnsid
             - upcall-stats
       dump: *vport-get-op
+    -
+      name: set
+      doc: |
+        Modify an existing OVS vport. The vport is picked by name, or by
+        port number when the request carries no name. An ifindex or options
+        are rejected with -EOPNOTSUPP, and a type that differs from the
+        vport's type with -EINVAL. The type only has to match; the one
+        attribute that changes state is upcall-pid. A successful set
+        also sends the updated vport to the family's multicast group,
+        and to the requester when the request sets NLM_F_ECHO.
+      value: 4
+      attribute-set: vport
+      dont-validate: [strict, dump]
+      flags: [uns-admin-perm]
+      do:
+        request:
+          attributes:
+            - name
+            - type
+            - upcall-pid
+            - port-no
 
 mcast-groups:
   list:
-- 
2.56.1

