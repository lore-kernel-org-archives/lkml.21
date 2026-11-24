Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557775;
	b=WEa7vheMxSrSq1DZjK7KTjfFDpXhIhfwvzckVBiHBQqt6T9CBB/JKen33zl0Fm3HEz9Y
	 Is0MTAzB4Q6YyLBq5tiFUH1YR/wyzo5MEHPyEcd5bn5PkFH2rDNs+t3nvNiaOVX/tQSMB
	 Jq4AmslKJCVeGwUOUnHbfHukxIJXD4CJ9oimK5pAEmh18g/mXiane9QyJx3c1fz5f0wwZ
	 DClNt9vda7piobsalMPG4pQQPM3OtSpgPlPs5aNy3Xyvdbqz6lb8EGZOpzrLPNf4pwEv8
	 bDYnNM++05ANrHL2GvC934wMA/qhpZ0Ft7HOQSOPDswRrfmrGR22Qsei7OVPO0WpAjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MTsG6ObX1QZphRq69WtSXAGO8I5Qp7B9rjGutUJIVt0=;
	b=lPy5822EXYqgi6Q1p4Nb/ejWy95yo1gNezKEXeNj9Dw/o5jBH8RvKWTrsIta0D3K0ykT
	 N7FCt0R3OXY89wECPy4hqZcjOP757gMDhPTduijyhsKTFINtBF6OIdc5CTXoxNie9bbgA
	 c/LMVxTmSRYfamQXYjbSn1wIwHwxzvJnkjD9U++xbaqhMOmfo/pD5W+RO0k92AZUCiEjk
	 vsTrGrHDlRi1d5jLnj3q7ONLQd2O487upEx+lOTeMKe0RKhldO1J/XFPtRkjwZ3o6N0iF
	 R33biEwqoJMYM3PeTaDQcipfEq+5Pslh/a2InPvD4Z9HSxGzP9gDlh6jUs1F4TS1ALw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Hz7o8//i";
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0471C606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:02:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0471C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hz7o8//i
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-8629ef8613aso2000684a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557774; x=1796162574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MTsG6ObX1QZphRq69WtSXAGO8I5Qp7B9rjGutUJIVt0=;
        b=Hz7o8//ifyypD2vcRuajMaBRFCCt7gq5hVxY4h34XSTuCklaUZjCviBkF/B6bk/hf3
         hctWcH7ztS2urkic7Jlkz9DF0pVagybCHw1UQ88mMHivAfyyKW5+g1+FDOr4vIAFFMTh
         C6K7wmKqxX7zD3McLzBVfxzWF0Tmo2/QUETVMRntMNrwbQILhPLUg/BFc7ze/Q7bldsO
         jqM9BRbs94s1/Dv0Y8Kz3nxiZRKTT2tIgkrEjM+ObxB2erd4R10JUdCFdt67Uj+wEVK1
         qnghUqKs225CQJsJlw07EKkVs0cE6y0yDyMxEyuHmpXx8XbTe9kTTB3eSQ0l53mc9yFN
         6BDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557774; x=1796162574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MTsG6ObX1QZphRq69WtSXAGO8I5Qp7B9rjGutUJIVt0=;
        b=pLYLQdqsQcBRUuIpDOwvdsMxaEij01EPInl3gxhZ1U75iY1yXRDiuFF3llT2qu+faH
         MoS0Y919s2WgockjidSU4gjRaNY82A/pQl/KGon0nzrbNGFq17SuwcbnpVTVX8WuwynA
         pwF8WsAgOKZoqov3f3tU0PIZjoH81IKMnleGmtP/BgaavfZQNpRft6uVl+fBkYyO7UeM
         9XdynD6y1xQIy1RHgPmnUGBRJPtZz6HXw1HbgWXMTrakD3EaXsdeEL1lPHzo8zaR2XF0
         3vQehSVHaFe4xwufAVXcRzkMIjdqrizg1lAsCvZvPFwTQA7s90I/51pPLNBROWeWZiPi
         mQ7g==
X-Forwarded-Encrypted: i=1; AL+hErHqSaimvL6fCf8+2ehALcbad3s1Aq3knC+6n8/Gl+IXJpa7ARcn8LtgKSUeJmp/bFPs3UMjewKaoZdz1UA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5LXE0mlrQx+HNlzHc8PrMRKxEuTebcYQ9LGw4NkDzPaL3UPec
	o0UZqSEXIP7u3p5P1lcnhAB/ofpyHl1LcqFAz8BrsmAYDSFl2ultd5Z9
X-Gm-Gg: AZFdTZekZnIiL40aQCX+z0b7mnVmQoFctlXKjrEKXGCFYYQn2Pm9VKNIQ1YmDkkgmCR
	8BtkrQKzvD2raab2rCy9V//jY2UfpVJklXTK2hYksGAnaY1/YhjOlOPqlaK3f9RE8IQS5RLaygR
	fyQuRuocjOKyj+jqC6ngd/QvyQUnwb90yGYT6+Bd7x457R/YHLeUYTPi5Tzfm9amEjTbzgR/QDb
	qCjkb7Rwy8JTdgjwUfNlV/4S+CSXRmHGGi6Jx6N+UaDaiXJxjfp0Mrp8BgUwmrhdRQ0NIF1mgiC
	BOvlEhcIZoJBkC6pRYpbP7Ccb9j1GtdaUMSHUbBhNicWi7CVn5kkoUdmxveN5oA7koNn7Lmgwbw
	Fr7MUxOvceKYdPArwVbzksPyVakpa07wC3NBmYulpJ90NSwSQ4zKKsY6oVrlzG2G1fP3HlebKjy
	1AEixp+A6+DKpybJalZ8YRGT2X8Iu0w6tw80HAx+tFQwmBbsYBZ6363y+m7JvHZp3Kj2aTWqjAj
	leAJ99r1hKZ26ppxXmVgufHbjdlcK23CR6ZyTU4v+W7BgQbz9xxwfh2lgfeYzFVcD3YRhukEGGu
	+7takl1hOIM7f2jmXq0Dnq5qmkM=
X-Received: by 2002:a05:6830:4119:b0:862:f05c:2fd with SMTP id 46e09a7af769-863152c5e83mr17966959a34.3.1795557773847;
        Tue, 24 Nov 2026 14:02:53 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:52::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168c1bc5sm11180539a34.6.2026.11.24.14.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:02:53 -0800 (PST)
From: Mohsin Bashir <mohsin.bashr@gmail.com>
To: netdev@vger.kernel.org
Cc: saeedm@nvidia.com,
	leon@kernel.org,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	cjubran@nvidia.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	mohsin.bashr@gmail.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3] net: mlx5: Allow police as the last action of a TC rule
Date: Tue, 24 Nov 2026 14:02:51 -0800
Message-ID: <20261124220251.776944-1-mohsin.bashr@gmail.com>
X-Mailer: git-send-email 2.53.1
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

From: Mohsin Bashir <hmohsin@meta.com>

In switchdev mode, mlx5 does not offload a rule where police is the last
action, although TC needs no other action for such a rule. The upcoming
selftest series relies on these rules. With nothing after police, the
police result alone decides where the packet goes, so each result must
be offloaded as TC executes it. The driver does not do that today. An ok
result is handled as pipe and runs the actions after police, a pipe
result always returns to the post action table, and a jump is counted
from police while TC counts it from the start of the action list. A rate
police is also rejected by verify_attr_actions(), as its forward to the
post meter table is added only after the check.

Make the offloaded rule behave as it does in TC. An ok result ends
processing in TC. A pipe result does the same when police is the last
action. Send both to the end of the TC chains as the driver already does
for gact ok. For jump, offload only the simple case where police is the
first action and the skipped actions are all drop or all ok. Reject the
rest. Existing rules where police is followed by other actions also
change. An ok result now accepts the packet instead of running those
actions. Finally set the forward to the post meter table while parsing
police. This is already done for police with mtu and lets a police-only
rule pass verify_attr_actions().

Tested on a ConnectX-7 in switchdev mode with the commands below. The
hardware drop counter showed that the rules are offloaded and limit the
traffic to the configured rate, that the second police only sees the
packets conforming to the first, and that the jump lands on its target.

  tc filter add dev eth0 ingress pref 100 protocol ipv6 flower skip_sw \
    ip_proto udp dst_port 5201 \
    action police rate 100mbit burst 1m conform-exceed drop/ok

  tc filter add dev eth0 ingress pref 100 protocol ipv6 flower skip_sw \
    ip_proto udp dst_port 5201 \
    action police rate 200mbit burst 1m conform-exceed drop/pipe \
    action police rate 100mbit burst 1m conform-exceed drop/pipe

  tc filter add dev eth0 ingress pref 100 protocol ipv6 flower skip_sw \
    ip_proto udp dst_port 5201 \
    action police rate 100mbit burst 1m conform-exceed drop / jump 2 \
    action drop action ok

Cc: Carolina Jubran <cjubran@nvidia.com>
Signed-off-by: Mohsin Bashir <hmohsin@meta.com>
---
Changelog:
v3:
  - Offload jump only when police is the first action, the target is a
    later action, the skipped actions are all drop or all ok, and the
    same action is not used twice in a row, as discussed on v2:
    https://lore.kernel.org/netdev/5c493bd0-31f5-430a-844a-ad011a5f0ba8@nvidia.com
  - Update commit message

v2: https://lore.kernel.org/netdev/20261119040010.1405900-1-mohsin.bashr@gmail.com
v1: https://lore.kernel.org/netdev/20261117031337.4126403-1-mohsin.bashr@gmail.com
---
 .../mellanox/mlx5/core/en/tc/act/police.c     | 59 ++++++++++++++++++-
 .../net/ethernet/mellanox/mlx5/core/en_tc.c   | 26 +++++---
 2 files changed, 75 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/police.c b/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/police.c
index 1bd1c94fb977..f03a992cbc27 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/police.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/police.c
@@ -37,6 +37,52 @@ static int police_act_validate(const struct flow_action_entry *act,
 	return 0;
 }
 
+static bool
+police_act_can_offload_jump(struct mlx5e_tc_act_parse_state *parse_state,
+			    const struct flow_action_entry *act,
+			    int act_index, u32 target)
+{
+	const struct flow_action *flow_action = parse_state->flow_action;
+	struct netlink_ext_ack *extack = parse_state->extack;
+	const struct flow_action_entry *prev, *entry;
+	u32 i;
+
+	if (act_index) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Jump is only supported when police is the first action");
+		return false;
+	}
+
+	if (!target || target >= flow_action->num_entries) {
+		NL_SET_ERR_MSG_MOD(extack, "Jump target must be a later action");
+		return false;
+	}
+
+	prev = act;
+	for (i = 1; i <= target; i++) {
+		entry = &flow_action->entries[i];
+
+		if (i < target &&
+		    ((entry->id != FLOW_ACTION_DROP &&
+		      entry->id != FLOW_ACTION_ACCEPT) ||
+		     entry->id != flow_action->entries[1].id)) {
+			NL_SET_ERR_MSG_MOD(extack,
+					   "Jump can only skip actions that are all drop or all ok");
+			return false;
+		}
+
+		if (entry->id == prev->id && entry->hw_index == prev->hw_index) {
+			NL_SET_ERR_MSG_MOD(extack,
+					   "Jump over the same action twice in a row is not supported");
+			return false;
+		}
+
+		prev = entry;
+	}
+
+	return true;
+}
+
 static bool
 tc_act_can_offload_police(struct mlx5e_tc_act_parse_state *parse_state,
 			  const struct flow_action_entry *act,
@@ -49,6 +95,16 @@ tc_act_can_offload_police(struct mlx5e_tc_act_parse_state *parse_state,
 	if (err)
 		return false;
 
+	if (act->police.exceed.act_id == FLOW_ACTION_JUMP &&
+	    !police_act_can_offload_jump(parse_state, act, act_index,
+					 act->police.exceed.extval))
+		return false;
+
+	if (act->police.notexceed.act_id == FLOW_ACTION_JUMP &&
+	    !police_act_can_offload_jump(parse_state, act, act_index,
+					 act->police.notexceed.extval))
+		return false;
+
 	return !!mlx5e_get_flow_meters(parse_state->flow->priv->mdev);
 }
 
@@ -94,13 +150,14 @@ tc_act_parse_police(struct mlx5e_tc_act_parse_state *parse_state,
 		      MLX5_FLOW_STEERING_CAP_MATCH_RANGES))
 			return -EOPNOTSUPP;
 
-		attr->action |= MLX5_FLOW_CONTEXT_ACTION_FWD_DEST;
 		attr->flags |= MLX5_ATTR_FLAG_MTU;
 	} else {
 		attr->action |= MLX5_FLOW_CONTEXT_ACTION_EXECUTE_ASO;
 		attr->exe_aso_type = MLX5_EXE_ASO_FLOW_METER;
 	}
 
+	attr->action |= MLX5_FLOW_CONTEXT_ACTION_FWD_DEST;
+
 	return 0;
 }
 
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
index 1d35c97aea0b..7e7111e6d058 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
@@ -3874,7 +3874,7 @@ static int
 alloc_branch_attr(struct mlx5e_tc_flow *flow,
 		  struct mlx5e_tc_act_branch_ctrl *cond,
 		  struct mlx5_flow_attr **cond_attr,
-		  u32 *jump_count,
+		  u32 *jump_count, bool last,
 		  struct netlink_ext_ack *extack)
 {
 	struct mlx5_flow_attr *attr;
@@ -3891,11 +3891,17 @@ alloc_branch_attr(struct mlx5e_tc_flow *flow,
 	case FLOW_ACTION_DROP:
 		attr->action |= MLX5_FLOW_CONTEXT_ACTION_DROP;
 		break;
-	case FLOW_ACTION_ACCEPT:
 	case FLOW_ACTION_PIPE:
-		err = set_branch_dest_ft(flow->priv, attr);
-		if (err)
-			goto out_err;
+		if (!last) {
+			err = set_branch_dest_ft(flow->priv, attr);
+			if (err)
+				goto out_err;
+			break;
+		}
+		fallthrough;
+	case FLOW_ACTION_ACCEPT:
+		attr->action |= MLX5_FLOW_CONTEXT_ACTION_FWD_DEST;
+		attr->flags |= MLX5_ATTR_FLAG_ACCEPT;
 		break;
 	case FLOW_ACTION_JUMP:
 		if (*jump_count) {
@@ -3967,7 +3973,7 @@ dec_jump_count(struct flow_action_entry *act, struct mlx5e_tc_act *tc_act,
 static int
 parse_branch_ctrl(struct flow_action_entry *act, struct mlx5e_tc_act *tc_act,
 		  struct mlx5e_tc_flow *flow, struct mlx5_flow_attr *attr,
-		  struct mlx5e_tc_jump_state *jump_state,
+		  struct mlx5e_tc_jump_state *jump_state, bool last,
 		  struct netlink_ext_ack *extack)
 {
 	struct mlx5e_tc_act_branch_ctrl cond_true, cond_false;
@@ -3980,7 +3986,7 @@ parse_branch_ctrl(struct flow_action_entry *act, struct mlx5e_tc_act *tc_act,
 	tc_act->get_branch_ctrl(act, &cond_true, &cond_false);
 
 	err = alloc_branch_attr(flow, &cond_true,
-				&attr->branch_true, &jump_count, extack);
+				&attr->branch_true, &jump_count, last, extack);
 	if (err)
 		goto out_err;
 
@@ -3988,7 +3994,7 @@ parse_branch_ctrl(struct flow_action_entry *act, struct mlx5e_tc_act *tc_act,
 		jump_state->jumping_attr = attr->branch_true;
 
 	err = alloc_branch_attr(flow, &cond_false,
-				&attr->branch_false, &jump_count, extack);
+				&attr->branch_false, &jump_count, last, extack);
 	if (err)
 		goto err_branch_false;
 
@@ -4052,7 +4058,9 @@ parse_tc_actions(struct mlx5e_tc_act_parse_state *parse_state,
 
 		dec_jump_count(act, tc_act, attr, priv, &jump_state);
 
-		err = parse_branch_ctrl(act, tc_act, flow, attr, &jump_state, extack);
+		err = parse_branch_ctrl(act, tc_act, flow, attr, &jump_state,
+					flow_action_is_last_entry(flow_action, act),
+					extack);
 		if (err)
 			goto out_free_post_acts;
 
-- 
2.53.1-Meta

