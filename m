Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725243;
	b=cwiY7oOlwGu9fVBlc+k1KkOzXkDLdJkXbHxQ+rks26kLFpf0qLX5+9TbddyTao0ILEy6
	 4B40le7txdeIdZAJiiO2bTFiCOUSfepKHz5gWyxTR3qPnDcHPl6/DaPWLqu90IK+CMvIV
	 d8pBUsGGIgwn0SX9xorBeZyS+jjQWYix0XE6pcWAdHbxJR0kW12ALs6d/59eZTVlIuqHk
	 JwWBb6L2hReHEq5ZXzCUmu36zfRJLZu4uW3By8nVdTWRdmzLplL/U6Q96iJkmC2BCWOQI
	 yzecdx4JpXcJQ983I+f9s5Y4vE3mD+N9SOhTjVSA5xcCTsaxyi7z+hOc0GAWkVlUR+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725243;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=nQh2wnVfC1ieRzwTg0A3RWd2OjYza/KrQTLhFoKiDso=;
	b=oKlWeXJivh4oI27qjj0xzw1CBNa5Q2r3wZsdIMNaf5iae6PnVHH8JROr+R+1HhJR1vHT
	 jwIt3Saw+K2kE3B7bdeR2jLEj3zYfPXkopJ9FgLzac0mo2n85uNSPOyahsDQ4PwDxGlNo
	 thXCBV8HXx/vEoMoTFErt6htDFsAWeUC+ogvuMEZtbTIdDERwKUknztM6dx33EIii1dm1
	 WPRJzctXAGSoCKt2a16crCWs0ASfOg9fRCmff43IbdoRTLs4qaYWX+NGSuupm39r5CrE/
	 Ky342bs3OrhhyMBjZmGOY23ltdqL6S1GPdSpJhzcL5/EqBGz/IKeG2+yrx0mjvs1ZqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WYxcraRO;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCA0606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DCA0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WYxcraRO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795725243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nQh2wnVfC1ieRzwTg0A3RWd2OjYza/KrQTLhFoKiDso=;
	b=WYxcraROjstz4kv39SMcl7DGmQwlxLMYMqrl5IvsD5HbYAI+1yYJA5HjJNUgfvEs7LN/+2
	q/tMq+OaZ1kTOBqsg+cuGQDX4ZjLFbzjgnQZ1hQqUu2AI5tA7hvA5xdWowS5wTEY4Rx2jG
	RQVs9/dFHQMR0GobX7gQ0NOMfzyL+LQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-139-Qlxq2nlVN4eJSyVNjQ9E_w-1; Thu,
 26 Nov 2026 20:33:58 +0000
X-MC-Unique: Qlxq2nlVN4eJSyVNjQ9E_w-1
X-Mimecast-MFC-AGG-ID: Qlxq2nlVN4eJSyVNjQ9E_w_1795725235
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 155841955F74;
	Thu, 26 Nov 2026 20:33:55 +0000 (UTC)
Received: from ivecera-thinkpadp16vgen1.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CAAE01801977;
	Thu, 26 Nov 2026 20:33:48 +0000 (UTC)
From: Ivan Vecera <ivecera@redhat.com>
To: netdev@vger.kernel.org
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	Min Li <min.li@microchip.com>,
	Grzegorz Nitka <grzegorz.nitka@intel.com>,
	Karol Kolacinski <karol.kolacinski@intel.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Petr Oros <poros@redhat.com>
Subject: [PATCH RFC net-next 11/19] dpll: drop the cached module name of a pin
Date: Thu, 26 Nov 2026 21:32:23 +0100
Message-ID: <20261126203231.934632-12-ivecera@redhat.com>
In-Reply-To: <20261126203231.934632-1-ivecera@redhat.com>
References: <20261126203231.934632-1-ivecera@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Commit c191b319f208 ("dpll: allow registering FW-identified pin with a
different DPLL") cached the module name in the pin, because a pin that
another driver registered with its DPLL could stay registered after the
module that created the pin was removed. Every pin is now registered by
the driver that created it, with its DPLLs or under a parent pin, and a
driver unregisters its pins before its module goes away.

Read the module name from the module again.

Signed-off-by: Ivan Vecera <ivecera@redhat.com>
---
 drivers/dpll/dpll_core.c    | 1 -
 drivers/dpll/dpll_core.h    | 2 --
 drivers/dpll/dpll_netlink.c | 6 +++---
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/dpll/dpll_core.c b/drivers/dpll/dpll_core.c
index 2371b81181471d..7440b174c3de2b 100644
--- a/drivers/dpll/dpll_core.c
+++ b/drivers/dpll/dpll_core.c
@@ -653,7 +653,6 @@ dpll_pin_alloc(u64 clock_id, u32 pin_idx, struct module *module,
 	pin->pin_idx = pin_idx;
 	pin->clock_id = clock_id;
 	pin->module = module;
-	strscpy(pin->module_name, module_name(module));
 	if (WARN_ON(prop->type < DPLL_PIN_TYPE_MUX ||
 		    prop->type > DPLL_PIN_TYPE_MAX)) {
 		ret = -EINVAL;
diff --git a/drivers/dpll/dpll_core.h b/drivers/dpll/dpll_core.h
index 1b3c74ef4c1b42..3b7e0af7f7ee6f 100644
--- a/drivers/dpll/dpll_core.h
+++ b/drivers/dpll/dpll_core.h
@@ -45,7 +45,6 @@ struct dpll_device {
  * @pin_idx:		index of a pin given by dev driver
  * @clock_id:		clock_id of creator
  * @module:		module of creator
- * @module_name:	module name of creator
  * @fwnode:		optional reference to firmware node
  * @links:		links to other pins (struct dpll_pin_link)
  * @dpll_refs:		hold referencees to dplls pin was registered with
@@ -61,7 +60,6 @@ struct dpll_pin {
 	u32 pin_idx;
 	u64 clock_id;
 	struct module *module;
-	char module_name[MODULE_NAME_LEN];
 	struct fwnode_handle *fwnode;
 	struct list_head links;
 	struct xarray dpll_refs;
diff --git a/drivers/dpll/dpll_netlink.c b/drivers/dpll/dpll_netlink.c
index 78017aae19a6f2..372de086a7eb3d 100644
--- a/drivers/dpll/dpll_netlink.c
+++ b/drivers/dpll/dpll_netlink.c
@@ -754,7 +754,7 @@ dpll_cmd_pin_get_one(struct sk_buff *msg, struct dpll_pin *pin,
 	if (ret)
 		return ret;
 	if (nla_put_string(msg, DPLL_A_PIN_MODULE_NAME,
-			   pin->module_name))
+			   module_name(pin->module)))
 		return -EMSGSIZE;
 	if (nla_put_64bit(msg, DPLL_A_PIN_CLOCK_ID, sizeof(pin->clock_id),
 			  &pin->clock_id, DPLL_A_PIN_PAD))
@@ -1630,9 +1630,9 @@ dpll_pin_find(u64 clock_id, struct nlattr *mod_name_attr,
 	xa_for_each_marked(&dpll_pin_xa, i, pin, DPLL_REGISTERED) {
 		prop = &pin->prop;
 		cid_match = clock_id ? pin->clock_id == clock_id : true;
-		mod_match = mod_name_attr && pin->module_name[0] ?
+		mod_match = mod_name_attr && module_name(pin->module) ?
 			!nla_strcmp(mod_name_attr,
-				    pin->module_name) : true;
+				    module_name(pin->module)) : true;
 		type_match = type ? prop->type == type : true;
 		board_match = board_label ? (prop->board_label ?
 			!nla_strcmp(board_label, prop->board_label) : false) :
-- 
2.56.1

